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
  -- Notification engine
  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = "BufRead",
    opts = {
      -- options
    },
  },
  -- Allows to enter "submodes" to use commands more smoothly
  -- TODO: use more or remove
  {
    "nvimtools/hydra.nvim",
    lazy = true,
    keys = { "<leader>tw" },
    config = function()
      require("config.plugins.settings.hydra")
    end,
  },
  -- Automatic formatting
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = require("config.plugins.settings.conform"),
  },
  -- quit buffers without quitting the window
  -- useful for clearing splits
  {
    "famiu/bufdelete.nvim",
    lazy = true,
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>q", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
    },
  },
  -- Surround things with symbols
  {
    "tpope/vim-surround",
    lazy = true,
    event = "InsertEnter",
    dependencies = { "tpope/vim-repeat" },
  },
  -- tree for branching undo history (!!)
  -- dont use it much BUT its cool
  {
    "mbbill/undotree",
    lazy = true,
    keys = {
      {
        "<leader>u",
        "<cmd>UndotreeToggle<CR><cmd><UndotreeFocus><CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Show Undotree",
      },
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require("config.plugins.settings.autopairs")
    end,
  },
  -- gcc binding does comments
  {
    "numToStr/Comment.nvim",
    lazy = true,
    keys = { "gc", "gb" },
    opts = {},
  },
  {
    "sindrets/winshift.nvim",
    lazy = true,
    keys = {
      { "<C-W><C-M>", "<cmd>WinShift<CR>", mode = "n", noremap = true, silent = true, desc = "Start WinShift" },
    },
  },
  -- wrapper for :substitute <leader>e
  {
    "wincent/scalpel",
    lazy = true,
    event = "BufRead",
  },
  -- lagless 'jk'->esc mapping
  {
    "nvim-zh/better-escape.vim",
    lazy = true,
    event = "InsertEnter",
    config = function() end,
  },
  -- Very nice wrapper for vim sessions - use more
  {
    "tpope/vim-obsession",
    lazy = false,
  },
}
