-- Indentation settings
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
-- File system keybinds
vim.keymap.set({"n","i"}, "<C-o>", "<esc>:Telescope fd<CR>", { noremap = true, silent = true})
vim.keymap.set({"n","i"}, "<C-f>", "<esc>:Telescope live_grep<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<space>fb", "<cmd>Telescope file_browser<CR>", { noremap = true })
vim.keymap.set({"n","i"}, "<C-l>", "<esc>:Oil --float<CR>", { noremap = true, silent = true })
-- Buffer closing keybinds
vim.keymap.set("n", "q", ":Bdelete", { noremap = true, silent = true })
-- Neotree keybind
vim.keymap.set("n", "nt", ":Neotree", { noremap = true, silent = true })
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
