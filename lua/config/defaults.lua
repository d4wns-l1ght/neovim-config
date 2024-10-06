-- Telescope keybinds
vim.keymap.set({"n","i"}, "<C-o>", "<esc>:Telescope fd<CR>", { noremap = true, silent = true})
vim.keymap.set({"n","i"}, "<C-f>", "<esc>:Telescope live_grep<CR>", { noremap = true, silent = true})
-- Make mousescrolling work properly with fugitive-vim blame
vim.o.mouse="a"
-- Split settings
vim.o.splitright = true
vim.o.splitbelow = true
-- Pretty cursor line :3
vim.o.cursorline = true
vim.o.cursorlineopt = "both"
