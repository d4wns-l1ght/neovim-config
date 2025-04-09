require("config.plugins.settings.lsp.autocmds")
local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
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

lspconfig.gopls.setup({})
