require("gitsigns").setup({
  signcolumn = true,
  current_line_blame = true,
  numhl = true,
})
local set_keymaps = require("util").set_keymaps
local gs = require("gitsigns")

set_keymaps({
  X = { gs.reset_hunk, "Reset hunk" },
  s = { gs.stage_hunk, "Stage hunk" },
  b = { gs.blame_line, "Blame line" },
  B = { gs.blame, "Blame file" },
  v = { gs.select_hunk, "Select hunk" },
  p = { gs.preview_hunk_inline, "Preview hunk inline" },
  P = { gs.preview_hunk, "Preview hunk floating" },
  j = {
    function()
      gs.nav_hunk("next")
    end,
    "Next hunk",
  },
  k = { gs.nav_hunk, "Prev hunk" },
  G = {
    function()
      gs.nav_hunk("last")
    end,
    "Last hunk",
  },
  g = {
    function()
      gs.nav_hunk("first")
    end,
    "First hunk",
  },
}, { prefix = "<leader>g", group_name = "Git" })
