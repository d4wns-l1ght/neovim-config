return {
  -- {
  --   "epwalsh/obsidian.nvim",
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "School",
  --         path = "~/Documents/Obsidian/School/",
  --       },
  --       {
  --         name = "Political Theory",
  --         path = "~/Documents/Obsidian/Political Theory/",
  --       }
  --     }
  --   }
  -- },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    ft = { "markdown", "quarto", "org" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      render_modes = true,
      heading = { backgrounds = {} },
      latex = { enabled = false },
    },
  },
}
