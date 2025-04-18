return {
  { "LintaoAmons/cd-project.nvim", version = "*", cmd = "CdProject" },
  {
    "folke/which-key.nvim",
    opts = {},
    lazy = false, -- needed to set keymaps
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
    event = "BufRead",
    opts = {
      -- options
    },
  },
  -- Allows to enter "submodes" to use commands more smoothly
  -- TODO: use more or remove
  {
    "nvimtools/hydra.nvim",
    keys = { "<leader>tw" },
    config = function()
      require("config.plugins.settings.hydra")
    end,
  },
  -- quit buffers without quitting the window
  -- useful for clearing splits
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete", "Bwipeout" },
    keys = {
      { "<leader>x", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
    },
  },
  -- Surround things with symbols
  { "tpope/vim-surround", dependencies = { "tpope/vim-repeat" } },
  -- tree for branching undo history (!!)
  -- dont use it much BUT its cool
  {
    "mbbill/undotree",
    keys = {
      {
        "<leader>u",
        "<cmd>UndotreeToggle<CR><cmd>UndotreeFocus<CR>",
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
    config = function()
      require("config.plugins.settings.autopairs")
    end,
  },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
  -- gcc binding does comments
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gb" },
    opts = {},
  },
  {
    "sindrets/winshift.nvim",
    keys = {
      { "<leader>ww", "<cmd>WinShift<CR>", mode = "n", noremap = true, silent = true, desc = "Enter WinShift Mode" },
    },
  },
  -- wrapper for :substitute <leader>e
  {
    "wincent/scalpel",
    lazy = false,
  },
  -- lagless 'jk'->esc mapping
  {
    "nvim-zh/better-escape.vim",
    event = "InsertEnter",
  },
  -- Very nice wrapper for vim sessions - use more
  {
    "tpope/vim-obsession",
    lazy = false,
  },
  {
    "jaimecgomezz/here.term",
    lazy = false,
    opts = {
      mappings = {
        enable = true,
        toggle = "<M-;>",
        kill = "<M-S-;>",
      },
    },
  },
}
