return {
  {
    "farmergreg/vim-lastplace",
    lazy = true,
    event = "VeryLazy",
  },
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.keymap.set({ "n", "x", "o" }, "f", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "F", "<Plug>(leap-backward)")
      vim.keymap.set({ "n", "x", "o" }, "gf", "<Plug>(leap-from-window)")
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
  -- Navigate along treesitter nodes
  {
    "aaronik/treewalker.nvim",
    lazy = true,
    cmd = "Treewalker",
    opts = {
      highlight = false, -- Whether to briefly highlight the node after jumping to it
    },
  },
}
