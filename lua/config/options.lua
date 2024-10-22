-- Indentation settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- Leader
vim.g.mapleader = " ";
-- TODO: Code actions

-- File system keybinds
vim.keymap.set({"n","i"}, "<C-o>", "<esc>:Telescope fd<CR>", { noremap = true, silent = true})
vim.keymap.set({"n","i"}, "<C-f>", "<esc>:Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>tf", "<cmd>Telescope file_browser<CR>", { noremap = true, silent = true, desc = "Telescope browser" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true, desc = "Grep files" })
vim.keymap.set("n", "<leader>o", "<cmd>Oil --float<CR>", { noremap = true, silent = true, desc = "Floating Oil" })
-- Buffer closing keybinds
vim.keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>", { noremap = true, silent = true })
-- Neotree keybind
vim.keymap.set("n", "<leader>nt", "<cmd>Neotree<CR>", { noremap = true, silent = true })
-- floating window
vim.keymap.set("n", "<leader>fl", "<cmd>Oil --float<CR><cmd>Bdelete<CR>", { noremap = true, silent = true })
-- lsp_lines toggle
function ToggleLspLines()
	require("lsp_lines").toggle()
	vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text})
end
vim.keymap.set("n", "<leader>l", ":lua ToggleLspLines()<CR>", { noremap = true, silent = true, desc = "Toggle lsp_lines" })
-- redo remap
vim.keymap.set('n', '<leader>u', '<C-r>', { noremap = true, silent = true})
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
