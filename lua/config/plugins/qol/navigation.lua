return {
  -- Navigation
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>f" },
    },
    config = function()
      require("config.plugins.settings.telescope")
    end,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
  },
  {
    lazy = false,
    "farmergreg/vim-lastplace",
  },
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
  {
    "kwkarlwang/bufresize.nvim",
    lazy = false,
    opts = {},
  },
  -- my beloved...
  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
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
