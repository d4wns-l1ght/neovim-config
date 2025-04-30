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
      {
        "axkirillov/easypick.nvim"
        -- dir = "~/Programming/Projects/easypick.nvim",
      },
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
  -- Navigate along treesitter nodes
  {
    "aaronik/treewalker.nvim",
    cmd = "Treewalker",
    opts = {
      highlight = false, -- Whether to briefly highlight the node after jumping to it
    },
  },
}
