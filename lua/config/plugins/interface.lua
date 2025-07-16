return {
  -- file system stuff
  {
    "stevearc/oil.nvim",
    keys = "<leader>o",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      local oil_open_folder = function(path)
        require("oil").open(path)
      end
      require("util").attach_file_browser("oil", oil_open_folder)
    end,
    config = function()
      require("config.plugins.settings.oil")
    end,
  },
  {
    "Eutrius/Otree.nvim",
    lazy = true,
    dependencies = {
      "stevearc/oil.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      hijack_netrw = false,
      use_default_keymaps = false,
      git_signs = true,
      keymaps = {
        ["<CR>"] = "actions.select",
        ["l"] = "actions.select",
        ["h"] = "actions.close_dir",
        ["<Esc>"] = "actions.close_win",
        ["K"] = "actions.goto_parent",
        ["J"] = "actions.goto_dir",
        ["~"] = "actions.goto_home_dir",
        ["`"] = "actions.change_home_dir",
        ["L"] = "actions.open_dirs",
        ["H"] = "actions.close_dirs",
        ["o"] = "actions.oil_dir",
        ["O"] = "actions.oil_into_dir",
        ["t"] = "actions.open_tab",
        ["v"] = "actions.open_vsplit",
        ["s"] = "actions.open_split",
        ["."] = "actions.toggle_hidden",
        ["i"] = "actions.toggle_ignore",
        ["r"] = "actions.refresh",
        ["f"] = "actions.focus_file",
        ["?"] = "actions.open_help",
      },
    },
  },
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
  -- Notification engine
  { "j-hui/fidget.nvim", event = "BufRead", opts = {} },
  -- Allows to enter "submodes" to use commands more smoothly
  -- TODO: use more or remove
  {
    "nvimtools/hydra.nvim",
    keys = { "<leader>tw" },
    config = function()
      require("config.plugins.settings.hydra")
    end,
  },
  -- misc
}
