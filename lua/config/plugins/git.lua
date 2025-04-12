return {
  -- git stuff
  {
    "tpope/vim-fugitive",
    cmd = "G",
  },
  {
    "harrisoncramer/gitlab.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    enabled = true,
    build = function()
      require("gitlab.server").build(true)
    end, -- Builds the Go binary
    keys = "<leader>gl",
    config = function()
      require("config.plugins.settings.gitlab")
    end,
  },
  -- Better git history
  {
    "rbong/vim-flog",
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  -- Extra git info
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("config.plugins.settings.gitsigns")
    end,
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },
}
