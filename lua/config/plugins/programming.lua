return {
  -- programming stuff
  { "williamboman/mason.nvim", event = "VeryLazy", config = true },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require("config.plugins.settings.lsp")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      require("config.plugins.settings.none-ls")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    keys = { ":", "/" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind.nvim",
      {
        "saadparwaiz1/cmp_luasnip",
        dependencies = {
          {
            "L3MON4D3/LuaSnip",
            dependencies = { "rafamadriz/friendly-snippets" },
            version = "v2.*",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
            end,
          },
        },
      },
    },
    config = function()
      require("config.plugins.settings.cmp")
    end,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "BufRead",
    opts = {},
  },
  -- Tests
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
    enabled = false,
    cmd = "Rest",
  },
  -- Lua
  { "folke/lazydev.nvim", ft = "lua" },
  -- }}}
}
