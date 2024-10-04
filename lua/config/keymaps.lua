vim.keymap.set({"n","i"}, "<C-o>", "<esc>:Telescope fd<CR>", { noremap = true, silent = true})

vim.keymap.set({"n","i"}, "<C-f>", "<esc>:Telescope live_grep<CR>", { noremap = true, silent = true})
