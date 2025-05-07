return {
  {
    "LintaoAmons/cd-project.nvim",
    version = "*",
    cmd = { "CdProject", "CdProjectAdd" },
    -- opts = {
    --   hooks = {
    --     {
    --       trigger_point = "BEFORE_CD",
    --       callback = function(o) end,
    --     },
    --   },
    -- },
  },
  {
    "folke/which-key.nvim",
    ---@class wk.Opts
    opts = {
      preset = "modern",
      delay = 0,
      keys = {
        Up = "<Up>",
        Down = "<Down>",
        Left = "<Left>",
        Right = "<Right>",
        C = "C-",
        M = "M-",
        D = "D-",
        S = "S-",
        CR = "<CR>",
        Esc = "<Esc>",
        ScrollWheelUp = "<ScrollWheelUp>",
        ScrollWheelDown = "<ScrollWheelDown>",
        NL = "<NL>",
        BS = "<BS>",
        Space = "<Space>",
        Tab = "<Tab>",
        F1 = "<F1>",
        F2 = "<F2>",
        F3 = "<F3>",
        F4 = "<F4>",
        F5 = "<F5>",
        F6 = "<F6>",
        F7 = "<F7>",
        F8 = "<F8>",
        F9 = "<F9>",
        F10 = "<F10>",
        F11 = "<F11>",
        F12 = "<F12>",
      },
    },
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
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("config.plugins.settings.autopairs")
    end,
  },
  { "windwp/nvim-ts-autotag", event = "InsertEnter", opts = {} },
  -- gcc binding does comments
  { "numToStr/Comment.nvim", keys = { "gc", "gb" }, opts = {} },
  {
    "sindrets/winshift.nvim",
    keys = {
      { "<leader>ww", "<cmd>WinShift<CR>", mode = "n", noremap = true, silent = true, desc = "Enter WinShift Mode" },
    },
  },
  -- wrapper for :substitute <leader>e
  { "wincent/scalpel", lazy = false },
  -- lagless 'jk'->esc mapping
  { "nvim-zh/better-escape.vim", event = "InsertEnter" },
  -- Very nice wrapper for vim sessions - use more
  { "tpope/vim-obsession", lazy = false },
  { "tpope/vim-eunuch", lazy = false },
  {
    "jaimecgomezz/here.term",
    keys = "<M-;>",
    opts = {
      mappings = {
        enable = true,
        toggle = "<M-;>",
        kill = "<M-S-;>",
      },
    },
  },
  { "AndrewRadev/bufferize.vim", cmd = "Bufferize" },
  -- TODO: configure (i don't know how rn)
  { url = "https://codeberg.org/babalark/trans-pose.nvim" },
}
