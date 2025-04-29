local set_keymaps = require("util").set_keymaps
local key_load = require("util").key_load

set_keymaps({
  f = {
    key_load("<leader>f", function()
      vim.cmd([[silent! Lazy load telescope.nvim ]])
    end),
    "Load Telescope",
  },
  o = {
    key_load("<leader>o", function()
      vim.cmd([[silent! Lazy load oil.nvim ]])
    end),
    "Load Oil",
  },
  r = {
    key_load("<leader>r", function()
      vim.cmd([[silent! Lazy load neotest ]])
    end),
    "Load Neotest",
  },
  d = {
    key_load("<leader>s", function()
      vim.cmd([[silent! Lazy load nvim-dap ]])
    end),
    "Load DAP",
  },
  gl = {
    key_load("<leader>gl", function()
      vim.cmd([[silent! Lazy load gitlab.nvim ]])
    end),
    "Load Gitlab",
  },
}, { prefix = "<leader>" })
