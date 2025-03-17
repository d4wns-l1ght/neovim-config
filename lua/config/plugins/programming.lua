return {
  -- programming stuff
  { "williamboman/mason.nvim", config = true },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("config.plugins.settings.lsp")
    end,
  },
  {
    "nvim-neotest/neotest",
    keys = "<leader>r",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("config.plugins.settings.neotest")
    end,
  },
  {
    "ms-jpq/coq_nvim",
    -- loaded in lsp.lua file apparently
    cmd = "COQnow",
    event = "InsertEnter",
    branch = "coq",
    dependencies = { "ms-jpq/coq.artifacts", branch = "artifacts" },
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
        keymap = {
          recommended = true,
          jump_to_mark = "<C-N>",
        },
      }
      -- dot not working workaround
      -- ref https://github.com/ms-jpq/coq_nvim/issues/464#issuecomment-1250233282
      vim.api.nvim_set_keymap(
        "i",
        ".",
        '<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(".<C-x><C-u><C-e>", true, false, true), "n", true)<CR>',
        { noremap = true }
      )
      vim.api.nvim_set_keymap("i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap("i", "<C-c>", [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap(
        "i",
        "<CR>",
        [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
        { expr = true, silent = true }
      )
      vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "BufRead",
    opts = {},
  },
  -- Tests
  {
    "andythigpen/nvim-coverage",
    version = "*",
    event = "BufRead",
    opts = { auto_reload = true },
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    -- TODO: Add more keys ref https://codeberg.org/babalark/nvim-config/src/branch/main/lua/myconfig/mappings.lua:157
    keys = { "<leader>d" },
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
      },
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
      require("config.plugins.settings.nvim-dap")
    end,
  },
  -- Treesitter stuff
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "BufRead",
    build = ":TSUpdate",
    config = function()
      require("config.plugins.settings.treesitter")
    end,
    dependencies = {
      { "m-demare/hlargs.nvim" },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        keyword = "fg",
      },
    },
  },
  -- languages {{{
  -- Java
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
  },
  -- Rust
  {
    -- TODO: add keymaps
    "mrcjkb/rustaceanvim",
    version = "*",
    lazy = false, -- it's already lazy
    init = require("config.plugins.settings.rustaceanvim"),
  },
  -- helps with adding crates to projects
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = "BufRead Cargo.toml",
    opts = require("config.plugins.settings.crates"),
  },
  -- Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    ft = "elixir",
    cmd = { "Mix" },
    config = function()
      require("config.plugins.settings.elixir-tools")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- HTTP
  -- nvim HTTP client
  {
    "rest-nvim/rest.nvim",
    cmd = "Rest",
  },
  -- }}}
}
