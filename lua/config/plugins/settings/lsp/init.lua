require("config.plugins.settings.lsp.autocmds")
local lspconfig = require("lspconfig")
local coq = require("coq")

lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}))

lspconfig.gopls.setup({})
