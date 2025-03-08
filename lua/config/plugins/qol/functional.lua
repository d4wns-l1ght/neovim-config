return {
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps (which-key)",
      },
    },
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "BufRead",
    opts = {
      -- options
    },
  },
  {
    "nvimtools/hydra.nvim",
    lazy = true,
    keys = { "<leader>tw" },
    config = function()
      require("config.plugins.settings.hydra")
    end,
  },
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = require("config.plugins.settings.conform"),
  },
  {
    "famiu/bufdelete.nvim",
    lazy = true,
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>q", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
    },
  },
  {
    "tpope/vim-surround",
    lazy = true,
    event = "InsertEnter",
    dependencies = { "tpope/vim-repeat" },
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>t", "<cmd>Trouble<CR>", mode = "n", noremap = true, silent = true, desc = "Trouble selector" },
    },
    dependencies = "nvim-telescope/telescope.nvim",
  },
  {
    "mbbill/undotree",
    lazy = true,
    event = "BufRead",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("config.plugins.settings.autopairs")
    end,
  },
  {
    "danymat/neogen",
    lazy = true,
    cmd = "Neogen",
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    lazy = true, -- adds keybinds that load itself somehow?
    opts = {},
  },
  {
    "sindrets/winshift.nvim",
    lazy = true,
    keys = {
      { "<C-W><C-M>", "<cmd>WinShift<CR>", mode = "n", noremap = true, silent = true, desc = "Start WinShift" },
    },
  },
  {
    "wincent/scalpel",
    lazy = true,
    event = "BufRead",
  },
  {
    "nvim-zh/better-escape.vim",
    lazy = true,
    event = "InsertEnter",
    config = function() end,
  },
  {
    "tpope/vim-obsession",
    lazy = false,
  },
}
