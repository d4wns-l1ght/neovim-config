local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = vim.tbl_extend(
    "force",
    require("telescope.themes").get_ivy({
      layout_config = { height = 12 },
    }),
    {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ["<C-h>"] = "which_key",
        },
      },
    }
  ),
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local telebuilt = require("telescope.builtin")
local set_keymaps = require("util").set_keymaps
set_keymaps({
  f = { telebuilt.buffers, "Find buffers" },
  ["."] = { telebuilt.find_files, "Find files" },
  [","] = {
    function()
      telebuilt.find_files({ no_ignore = true, no_ignore_parent = true, hidden = true })
    end,
    "Find all files",
  },
  ["/"] = { telebuilt.current_buffer_fuzzy_find, "Fuzzy find" },
  a = { telebuilt.builtin, "Telescope builtins" },
  t = { vim.cmd.TodoTelescope, "Find TODOs" },
  g = { telebuilt.live_grep, "Live grep" },
  h = { telebuilt.help_tags, "Help tags" },
  j = { telebuilt.jumplist, "Jump list" },
  l = { telebuilt.loclist, "Location list" },
  m = { telebuilt.man_pages, "Man pages" },
  o = { require("cd-project.adapter").cd_project, "Search projects" },
  p = { telebuilt.oldfiles, "Previous files" },
  q = { telebuilt.quickfix, "Quickfix" },
  r = { telebuilt.registers, "Registers" },
  s = { telebuilt.treesitter, "Treesitter symbols" },
}, { prefix = "<leader>f", group_name = "Telescope" })
