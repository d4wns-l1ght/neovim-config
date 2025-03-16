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

local oil = require("oil")
local keymaps = require("util").set_keymaps

keymaps({
  o = { oil.open, "Open oil" },
  c = { oil.close, "Close oil" },
  f = { oil.toggle_float, "Toggle floating oil" },
  h = { oil.toggle_hidden, "Toggle hidden files" },
  d = { oil.discard_all_changes, "Discard all changes" },
}, { prefix = "<leader>o", group_name = "Oil" })

oil.setup({
  default_file_explorer = true,
  watch_for_changes = true,
  view_options = { show_hidden = true },
  skip_confirm_for_simple_edits = true,
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
