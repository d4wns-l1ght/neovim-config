return {
  -- Navigation
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader>f" },
    },
    config = function()
      require("config.plugins.settings.telescope")
    end,
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "jonarrien/telescope-cmdline.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "d4wns-l1ght/telescope-git-conflicts.nvim",
      "paopaol/telescope-git-diffs.nvim",
      "catgoose/telescope-helpgrep.nvim",
      "tsakirist/telescope-lazy.nvim",
      "d4wns-l1ght/telescope-messages.nvim",
      "debugloop/telescope-undo.nvim",
    },
  },
  {
    "dmtrKovalenko/fff.nvim",
    -- Until it's in a more polished state
    lazy = true,
    build = "cargo build --release",
    opts = {
      prompt = "> ",
      keymaps = {
        move_up = "<C-k>",
        move_down = "<C-j>",
      },
    },
  },
  { "farmergreg/vim-lastplace", lazy = false },
  {
    "ggandor/leap.nvim",
    lazy = false, -- lazy loads itself
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")
      vim.keymap.set({ "n", "x", "o" }, "gF", function()
        require("leap.remote").action()
      end)
    end,
  },
  -- keeps windows proportional when creating
  { "kwkarlwang/bufresize.nvim", lazy = false, opts = {} },
  {
    "dynamotn/Navigator.nvim",
    opts = {},
    keys = {
      { "<c-h>", "<cmd>NavigatorLeft<cr>" },
      { "<c-j>", "<cmd>NavigatorDown<cr>" },
      { "<c-k>", "<cmd>NavigatorUp<cr>" },
      { "<c-l>", "<cmd>NavigatorRight<cr>" },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    -- "d4wns-l1ght/hardtime.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disabled_filetypes = { "markdown", "gitsigns-blame" },
      disabled_keys = {
        ["<Up>"] = { "n" },
        ["<Down>"] = { "n" },
        ["<Left>"] = { "n" },
        ["<Right>"] = { "n" },
      },
      restricted_keys = {
        ["<C-N>"] = {},
      },
    },
  },
  -- Navigate along treesitter nodes
  {
    "aaronik/treewalker.nvim",
    cmd = "Treewalker",
    opts = {
      highlight = false, -- Whether to briefly highlight the node after jumping to it
    },
  },
}
