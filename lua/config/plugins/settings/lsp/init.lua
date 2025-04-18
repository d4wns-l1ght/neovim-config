require("config.plugins.settings.lsp.autocmds")

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      format = {
        enable = false,
      },
    },
  },
})
