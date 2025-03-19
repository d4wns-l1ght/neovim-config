local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("LspAttach", {
  callback = function() -- toggle inline hints,
    Toggle_inlay = function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
    end
    vim.keymap.set("n", "<leader>ti", Toggle_inlay, { silent = true, desc = "Toggle LSP inlay hints" })
    vim.keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.rename()<cr>", { silent = true, desc = "LSP rename" })

    vim.lsp.inlay_hint.enable()
  end,
})
-- {{{ Format on save
autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
-- }}}
-- {{{ To maintain cursor style after exiting neovim
vim.api.nvim_create_autocmd("ExitPre", {
  group = vim.api.nvim_create_augroup("Exit", { clear = true }),
  command = "set guicursor=a:ver90",
  desc = "Set cursor back to beam when leaving Neovim.",
})
-- }}}
