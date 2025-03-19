local oil = require("oil")
local keymaps = require("util").set_keymaps

function _G.get_oil_winbar()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dir = require("oil").get_current_dir(bufnr)
  if dir then
    return vim.fn.fnamemodify(dir, ":~")
  else
    -- If there is no current directory (e.g. over ssh), just show the buffer name
    return vim.api.nvim_buf_get_name(0)
  end
end

keymaps({
  o = {
    function()
      if vim.bo.filetype == "oil" then
        oil.close()
      else
        oil.open()
      end
    end,
    "Toggle oil",
  },
  f = { oil.toggle_float, "Toggle floating oil" },
  h = { oil.toggle_hidden, "Toggle hidden files" },
  d = { oil.discard_all_changes, "Discard all changes" },
}, { prefix = "<leader>o", group_name = "Oil" })

-- helper function to parse output
local function parse_output(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
      -- Remove trailing slash
      line = line:gsub("/$", "")
      ret[line] = true
    end
  end
  return ret
end

-- build git status cache
local function new_git_status()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system(
        { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
        {
          cwd = key,
          text = true,
        }
      )
      local tracked_proc = vim.system({ "git", "ls-tree", "HEAD", "--name-only" }, {
        cwd = key,
        text = true,
      })
      local ret = {
        ignored = parse_output(ignore_proc),
        tracked = parse_output(tracked_proc),
      }

      rawset(self, key, ret)
      return ret
    end,
  })
end
local git_status = new_git_status()

local refresh = require("oil.actions").refresh
local orig_refresh = refresh.callback
refresh.callback = function(...)
  git_status = new_git_status()
  orig_refresh(...)
end

oil.setup({
  default_file_explorer = true,
  watch_for_changes = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    is_hidden_file = function(name, bufnr)
      local dir = require("oil").get_current_dir(bufnr)
      local is_dotfile = vim.startswith(name, ".") and name ~= ".."
      -- if no local directory (e.g. for ssh connections), just hide dotfiles
      if not dir then
        return is_dotfile
      end
      -- dotfiles are considered hidden unless tracked
      if is_dotfile then
        return not git_status[dir].tracked[name]
      else
        -- Check if file is gitignored
        return git_status[dir].ignored[name]
      end
    end,
  },
  win_options = {
    signcolumn = "yes:2",
    winbar = "%!v:lua.get_oil_winbar()",
  },
  columns = {
    "icon",
    "git",
    "size",
  },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 30,
  },
  keymaps = {
    ["<BS>"] = { "actions.parent", mode = "n" },
  },
  git = {
    add = function(_)
      return true
    end,
    rm = function(_)
      return true
    end,
    mv = function(_, _)
      return true
    end,
  },
})
