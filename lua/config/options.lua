-- Indentation settings
-- The amount of "spaces" indented automatically
vim.o.shiftwidth = 4
-- the amount of spaces a tab takes up
vim.o.tabstop = 4
-- unclear
vim.o.softtabstop = 4
-- whether tabs are replaced with spaces
vim.o.expandtab = true
-- vim.opt.colorcolumn = "80"
-- Leader
vim.g.mapleader = " "
-- TODO: Code actions

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
-- Make mousescrolling work properly with fugitive-vim blame
vim.o.mouse = "a"
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
