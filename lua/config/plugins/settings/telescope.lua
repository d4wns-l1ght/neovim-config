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
