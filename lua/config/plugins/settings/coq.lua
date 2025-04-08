vim.g.coq_settings = {
    auto_start = "shut-up",
    keymap = {
        recommended = true,
        jump_to_mark = "<C-R>",
    },
}
-- dot not working workaround
-- ref https://github.com/ms-jpq/coq_nvim/issues/464#issuecomment-1250233282
vim.api.nvim_set_keymap(
    "i",
    ".",
    '<cmd>lua vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(".<C-x><C-u><C-e>", true, false, true), "n", true)<CR>',
    { noremap = true }
)
vim.api.nvim_set_keymap("i", "<Esc>", [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-c>", [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<BS>", [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap(
    "i",
    "<CR>",
    [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
    { expr = true, silent = true }
)
vim.api.nvim_set_keymap("i", "<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
