local telescope = require('telescope')

telescope.setup {
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_cursor {} }
  },
  require("telescope.themes").get_ivy {
    layout_config = { height = 12 },
    borderchars = {
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  },

}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
