require("config.plugins.settings.lsp.autocmds")

vim.lsp.enable("lua_ls")
vim.lsp.config("lua_ls", {
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
vim.lsp.enable("marksman")
vim.lsp.enable("html")
vim.lsp.config("html", {
  filetypes = {"html", "templ", "htmldjango"},
  settings = {
    html = {
      format = {
        templating = true,
        wrapLineLength = 120,
        wrapAttributes = "auto",
      },
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
})
vim.lsp.enable("pyright")
