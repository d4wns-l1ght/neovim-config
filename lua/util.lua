local M = {}

-- stolen from https://codeberg.org/babalark/nvim-config/src/branch/main/lua/myconfig/util.lua
-- ty sofa :)

---Returns a function that runs the function, then presses the keys again.
---Useful for lazy loading on keybinds
---@param keys string
---@param func function
function M.key_load(keys, func)
    return function ()
        func()

        local term_keys = vim.api.nvim_replace_termcodes(keys, true, false, true)
        vim.schedule(function()
            vim.api.nvim_feedkeys(term_keys, "mt", false)
        end)
    end
end


---@param maps { name: string?, [string]: [string|function, string, vim.keymap.set.Opts?]}
---@param opts { prefix: string?, group_name: string?, mode: string|string[]|nil, hidden: boolean?, buffer: integer?}|nil
function M.set_keymaps(maps, opts)
  local opts = opts or {}
  local prefix = opts.prefix or ""
  local mode = opts.mode or "n"

  if type(mode) == "string" then
    local arr = {}
    for c in mode:gmatch(".") do
      arr[#arr + 1] = c
    end
    mode = arr
  end

  local ok, wk = pcall(require, "which-key")
  for k, v in pairs(maps) do
    if type(v) == "string" and ok then
      wk.add({ { prefix .. k, desc = v } })
    else
      local o = vim.tbl_extend("force", { desc = v[2], hidden = opts.hidden, buffer = opts.buffer }, v[3] or {})

      local hidden = o.hidden
      o.hidden = nil
      if hidden and ok then
        wk.add({ { prefix .. k, hidden = hidden } })
      end

      vim.keymap.set(mode, prefix .. k, v[1], o)
    end
  end

  if ok and opts.group_name and opts.prefix and not opts.hidden then
    wk.add({ { opts.prefix, group = opts.group_name } })
  end
end

-- https://github.com/polirritmico/neovim.conf/blob/hal-9002/lua/utils/autocmd.lua
function M.attach_file_browser(plugin_name, plugin_open)
  local previous_buffer_name
  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("File browser", { clear = true }),
    desc = string.format("[%s] replacement for Netrw", plugin_name),
    pattern = "*",
    callback = function()
      vim.schedule(function()
        local buffer_name = vim.api.nvim_buf_get_name(0)
        if vim.fn.isdirectory(buffer_name) == 0 then
          _, previous_buffer_name = pcall(vim.fn.expand, "#:p:h")
          return
        end

        -- Avoid reopening when exiting without selecting a file
        if previous_buffer_name == buffer_name then
          previous_buffer_name = nil
          return
        else
          previous_buffer_name = buffer_name
        end

        -- Ensure no buffers remain with the directory name
        vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = 0 })
        plugin_open(vim.fn.expand("%:p:h"))
      end)
    end,
  })
end

return M
