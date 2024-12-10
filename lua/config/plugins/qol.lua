return {
  -- QoL {{{
  -- Informative
  {
    "folke/which-key.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({global = false})
        end,
        desc = "Buffer local keymaps (which-key)",
      },
    },
  },
  -- Functional
  {
    "stevearc/conform.nvim",
    lazy = true,
    event = "BufWritePre",
    opts = require "config.plugins.settings.conform"
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
    'folke/trouble.nvim',
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
    event = "BufRead"
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    lazy = true,
    config = function()
      require "config.plugins.settings.autopairs"
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
      { "<C-W><C-M>", "<cmd>WinShift<CR>", mode = "n", noremap = true, silent = true, desc = "Start WinShift"}
    }
  },
  {
    "wincent/scalpel",
    lazy = true,
    event = "BufRead"
  },
  -- Navigation
  {
    "farmergreg/vim-lastplace",
    lazy = true,
    event = "VeryLazy"
  },
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = { "tpope/vim-repeat"},
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 'f',  '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'F',  '<Plug>(leap-backward)')
      vim.keymap.set({'n', 'x', 'o'}, 'gf', '<Plug>(leap-from-window)')
    end,
  },
  {
    "kwkarlwang/bufresize.nvim",
    lazy = true,
    keys = { { "<C-W><C-M>"} },
    opts = {},
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },
  -- Misc
  {
    "m4xshen/hardtime.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim"
    },
    opts = {
      disabled_filetypes = {
        "qf", "netrw", "neo-tree", "lazy", "oil", "mason", "fugitive", "help", "git", "trouble"
      },
    },
  },
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",  -- Use the latest tagged version
    lazy = true,
    keys = {
      {"<leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
      {"<leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

      {"<leader>cl", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
    },
  },
  -- Visual
  {
    "lukas-reineke/virt-column.nvim",
    lazy = true,
    opts = {}
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    ft = { "markdown", "quarto", "org" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'
    },
    opts = {
      render_modes = true,
      heading = {	backgrounds = {} },
      latex = { enabled = false },
    },
  },
  {
    "rainbowhxch/beacon.nvim",
    lazy = true,
    event = "BufRead",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead"
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufRead",
    main = "ibl",
    opts = {}
  },
  {
    "nvimdev/hlsearch.nvim",
    lazy = true,
    event = "BufRead",
    opts = {}
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
  -- }}}
}
