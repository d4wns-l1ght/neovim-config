-- Indentation settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- Leader
vim.g.mapleader = " ";
-- colors
vim.opt.termguicolors = true
-- TODO: Code actions

-- File system keybinds
vim.keymap.set("n", "<leader>ol", "<cmd>Oil --float<CR>", { noremap = true, silent = true, desc = "Floating Oil" })
-- floating window
vim.keymap.set("n", "<leader>fl", "<cmd>Oil --float<CR><cmd>Bdelete<CR>", { noremap = true, silent = true })
-- lsp_lines toggle
function ToggleLspLines()
	require("lsp_lines").toggle()
	vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text})
end
vim.keymap.set("n", "<leader>tl", ":lua ToggleLspLines()<CR>", { noremap = true, silent = true, desc = "Toggle lsp_lines" })
-- redo remap
vim.keymap.set('n', '<leader>u', '<C-r>', { noremap = true, silent = true, desc = "Redo" })
-- hide virtual text re lsp_lines
vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})
-- Make mousescrolling work properly with fugitive-vim blame
vim.o.mouse="a"
-- Split settings
vim.o.splitright = true
vim.o.splitbelow = true
-- Pretty cursor line :3
vim.o.cursorline = true
vim.o.cursorlineopt = "both"
-- Don't need to show mode with lualine :)
vim.o.showmode = false
vim.diagnostic.config({update_in_insert = true})
