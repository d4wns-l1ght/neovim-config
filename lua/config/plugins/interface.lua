return {
  -- main interface stuff
  {
    "nvim-lualine/lualine.nvim",
    event = "UiEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = require("config.plugins.settings.lualine"),
  },
  -- For combined relative & absolute line numbers
  {
    "akho/numbers.vim",
    event = "BufRead",
    config = function()
      vim.g.numbers_exclude = {
        "unite",
        "tagbar",
        "startify",
        "gundo",
        "vimshell",
        "w3m",
        "neo-tree",
        "lazy",
      }
      vim.g.numbers_exclude_buffers = {
        "acwrite",
        "help",
        "nofile",
        "nowrite",
        "quickfix",
        "terminal",
        "oil",
      }
    end,
  },
  -- file system stuff
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>nt",
        "<cmd>Neotree toggle focus<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Toggle Neotree",
      },
      {
        "<leader>gt",
        "<cmd>Neotree float git_status<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Neotree git view",
      },
      {
        "<leader>bt",
        "<cmd>Neotree toggle buffers focus right<CR>",
        mode = "n",
        noremap = true,
        silent = true,
        desc = "Toggle Neotree buffer view",
      },
    },
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim",
    },
    opts = require("config.plugins.settings.neotree"),
  },
  {
    "stevearc/oil.nvim",
    keys = "<leader>o",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "refractalize/oil-git-status.nvim",
    },
    config = function()
      require("config.plugins.settings.oil")
    end,
  },
  -- search stuff
  -- Gives more info when searching
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufRead",
    opts = {},
  },
  -- Removes search highlights once done
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    opts = {},
  },
  -- misc
  {
    -- "m4xshen/hardtime.nvim",
    -- dir = "~/Programming/Projects/hardtime.nvim",
    "d4wns-l1ght/hardtime.nvim",
    lazy = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disabled_filetypes = { "markdown" },
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
  { "akinsho/toggleterm.nvim", cmd = "ToggleTerm", version = "*", config = true },
}
