local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("LspAttach", {
  callback = function()
    vim.lsp.inlay_hint.enable()
  end,
})
-- {{{ Terminals
-- Stolen :)
-- Automatically go into insert mode and remove line numbers
autocmd("TermOpen", {
  callback = function()
    vim.o.number = false
    vim.o.relativenumber = false
    vim.cmd('startinsert')
  end,
})
-- }}}
-- {{{ Neotree with nvim .
autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    local arg = vim.fn.argv(0)
    if arg == "." then
      vim.cmd("Neotree")
    end
  end
})
-- }}}
