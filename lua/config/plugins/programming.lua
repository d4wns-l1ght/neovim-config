return {
  -- programming stuff
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require "config.plugins.settings.lsp"
    end,
  },
  {
    "ms-jpq/coq_nvim",
    lazy = true,
    cmd = "COQnow",
    event = "InsertEnter",
    branch = "coq",
    dependencies = { "ms-jpq/coq.artifacts", branch = "artifacts" },
    init = function()
      vim.g.coq_settings = {
        auto_start = 'shut-up',
        keymap = { recommended = false },
      }
      -- dot not working workaround
      -- ref https://github.com/ms-jpq/coq_nvim/issues/464#issuecomment-1250233282
      vim.api.nvim_set_keymap('i', '.', '<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(".<C-x><C-u><C-e>", true, false, true), "n", true)<CR>', { noremap = true })
      vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap(
        "i",
        "<CR>",
        [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
        { expr = true, silent = true }
      )
      vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
      vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = true,
    event = "BufRead",
    opts = {},
  },
  -- Debugging
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    -- TODO: Add more keys ref https://codeberg.org/babalark/nvim-config/src/branch/main/lua/myconfig/mappings.lua:157
    keys = {
      "<leader>d",
      { "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", mode = "n", noremap = true, silent = true, desc = "Toggle breakpoint" },
      { "<leader>du", ":lua require'dapui'.toggle()<CR>", mode = "n", noremap = true, silent = true, desc = "Show DAP UI" },
    },
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-neotest/nvim-nio" },
        opts = {},
      },
      { "theHamsta/nvim-dap-virtual-text" },
    },
    config = function()
      require "config.plugins.settings.nvim-dap"
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
  },
  {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        keyword = "fg"
      }
    },
  },
  -- languages {{{
  {
    "mfussenegger/nvim-jdtls",
    lazy = true,
    ft = "java",
  },
  -- Rust
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false, -- it's already lazy
    init = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(client, bufnr)
            vim.cmd("COQnow --shut-up")
          end,
        }
      }
    end,
  },
  {
    'saecki/crates.nvim',
    lazy = true,
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    opts = require "config.plugins.settings.crates",
  },
  -- Elixir
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    lazy = true,
    ft = "elixir",
    cmd = { "Mix" },
    config = function()
      require "config.plugins.settings.elixir-tools"
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- HTTP
  {
    'rest-nvim/rest.nvim',
    lazy = true,
    cmd = 'Rest'
  },
  -- }}}
}
