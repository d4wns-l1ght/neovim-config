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
    "famiu/bufdelete.nvim",
    lazy = true,
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>q", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
    },
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
    'nmac427/guess-indent.nvim',
    lazy = false,
    config = function()
      require('guess-indent').setup{}
    end,
  },
  {
    "danymat/neogen",
    lazy = true,
    cmd = "Neogen",
    opts = {},
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
      require("leap").add_default_mappings()
    end,
  },
  -- Misc
  {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",  -- Use the latest tagged version
    lazy = true,
    keys = {
      {"<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "x"}, desc = "Add cursor and move down"},
      {"<C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "x"}, desc = "Add cursor and move up"},

      {"<leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = {"n", "x"}, desc = "Add cursors to cword"},
      {"<leader>A", "<Cmd>MultipleCursorsAddMatchesV<CR>", mode = {"n", "x"}, desc = "Add cursors to cword in previous area"},

      {"<leader>cl", "<Cmd>MultipleCursorsLock<CR>", mode = {"n", "x"}, desc = "Lock virtual cursors"},
    },
  },
  -- Visual
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require "config.plugins.settings.lualine", -- TODO: customise lualine
    lazy = false,
  },
  {
    "akho/numbers.vim",
    lazy = true,
    event = "BufRead",
    config = function()
      vim.g.numbers_exclude = {
        'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', --superset
        "neo-tree","lazy", "oil"
      }
      vim.g.numbers_exclude_buffers = {
        'acwrite', 'help', 'nofile', 'nowrite', 'quickfix', 'terminal'
      }
    end,
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
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
  -- }}}
}
