return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("config.plugins.settings.lualine"), -- TODO: customise lualine
    lazy = false,
  },
  {
    "petertriho/nvim-scrollbar",
    lazy = true,
    event = "BufRead",
    opts = {},
  },
  {
    "akho/numbers.vim",
    lazy = true,
    event = "BufRead",
    config = function()
      vim.g.numbers_exclude = {
        "unite",
        "tagbar",
        "startify",
        "gundo",
        "vimshell",
        "w3m", --superset
        "neo-tree",
        "lazy",
        "oil",
      }
      vim.g.numbers_exclude_buffers = {
        "acwrite",
        "help",
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
      }
    end,
  },
  -- {
  --   "lukas-reineke/virt-column.nvim",
  --   opts = {}
  -- },
  {
    "rainbowhxch/beacon.nvim",
    lazy = true,
    event = "BufRead",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufRead",
    main = "ibl",
    opts = {},
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}
