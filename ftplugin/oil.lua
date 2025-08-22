local ok, oil = pcall(require, "oil")
if not ok then
  return
end
local kmap = require("util").set_keymaps
local style = "single"

local function do_popup(cmd)
    return vim.schedule_wrap(function()
      local d = oil.get_current_dir()
      local f = oil.get_cursor_entry()
      -- Just in case
      if d == nil or f == nil or f.name == nil then
        vim.notify("Error getting current entry", vim.log.levels.ERROR)
        return
      end

      local name = d .. f.name
      -- Apparently this is the cool way of doing that 
      local args = vim.iter({cmd, name}):flatten(math.huge):totable()

      -- Fast contexts :smiley:
      vim.system(args, {text = true, timeout = 1000}, vim.schedule_wrap(function(out)
        if out.code ~= 0 then
            vim.notify("Error running file (code " .. out.code .. "): ", vim.log.levels.ERROR)
            vim.notify(out.stderr, vim.log.levels.ERROR)
          return
        end

        vim.lsp.util.open_floating_preview({out.stdout}, "file", {border = style})
      end))
    end)
end
kmap({
  gm = {
    do_popup({"file", "-b"}),
    "Show 'file' description",
  },
  gM = {
    do_popup({"file", "-b", "-i"}),
    "Show 'file' mimetype",
  },
}, { buffer = 0, mode = "n" })
