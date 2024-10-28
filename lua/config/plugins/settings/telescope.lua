local telescope = require('telescope')

telescope.setup {
  defaults = vim.tbl_extend(
    "force",
    require("telescope.themes").get_ivy {
      layout_config = { height = 12 },
    },
    {
      mappings = {
        i = {}
      }
    }
  ),
  pickers = {
    colorscheme = {
      enable_preview = true,
    }
  },
}

telescope.load_extension('fzf')
telescope.load_extension('ui-select')
