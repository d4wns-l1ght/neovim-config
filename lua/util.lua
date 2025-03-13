local M = {}

-- stolen from https://codeberg.org/babalark/nvim-config/src/branch/main/lua/myconfig/util.lua
-- ty sofa :)
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
      wk.add({ { opts.prefix .. k, desc = v } })
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

return M
