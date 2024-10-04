local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- {{{ Terminals
-- Stolen :)
-- Automatically go into insert mode and remove line numbers
autocmd({ "TermOpen" }, {
	callback = function()
		vim.o.number = false
		vim.o.relativenumber = false
		vim.cmd('startinsert')
	end,
})
-- }}}
