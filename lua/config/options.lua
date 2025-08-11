-- Indentation settings
-- The amount of "spaces" indented automatically (e.g. with > = <). Set to 0 to default to tabstop value
vim.o.shiftwidth = 0
-- the amount of spaces a tab takes up
vim.o.tabstop = 4
-- whether tabs are replaced with spaces
vim.o.expandtab = false
-- vim.opt.colorcolumn = "80"
-- Leader
vim.g.mapleader = " "
-- File system keybinds
-- redo remap
vim.keymap.set("n", "U", "<C-r>", { noremap = true, silent = true, desc = "Redo" })
-- source default session
vim.keymap.set(
	"n",
	"<leader>ss",
	":source Session.vim<CR>",
	{ noremap = true, silent = true, desc = "Source default session" }
)
-- hide virtual text re lsp_lines
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
-- Split settings
vim.o.splitright = true
vim.o.splitbelow = true
-- Pretty cursor line :3
vim.o.cursorline = true
vim.o.cursorlineopt = "both"
-- Don't need to show mode with lualine :)
vim.o.showmode = false
-- retain terminal even when not visible
vim.o.hidden = true
vim.o.scrolloff = 4
-- from https://codeberg.org/babalark/nvim-config/commit/64b30f99cd9023486430da94cae8c4df29c1c7ce
-- Show dots for trailing spaces and bar for tabs
vim.o.list = true
vim.opt.listchars:append({ trail = "•" })
vim.opt.listchars:append({ tab = "┃ " })
vim.o.undofile = true
vim.o.signcolumn = "yes:1"

vim.opt.termguicolors = true
