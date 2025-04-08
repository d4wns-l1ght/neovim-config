return {
  -- Treesitter stuff
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufRead",
    build = ":TSUpdate",
    config = function()
      require("config.plugins.settings.treesitter")
    end,
    dependencies = {
      { "m-demare/hlargs.nvim" },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        keyword = "fg",
      },
    },
  },
  -- makes a little flash whenever the cursor moves
  {
    "DanilaMihailov/beacon.nvim",
    event = "BufRead",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    opts = {},
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}
