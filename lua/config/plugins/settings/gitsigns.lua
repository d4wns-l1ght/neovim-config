require("gitsigns").setup({
  signcolumn = true,
  current_line_blame = true,
  numhl = true,
})
require("scrollbar.handlers.gitsigns").setup()

local set_keymaps = require("util").set_keymaps
local gs = require("gitsigns")

set_keymaps({
  r = { gs.reset_hunk, "Reset hunk" },
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
  gg = {
    function()
      gs.nav_hunk("First")
    end,
    "First hunk",
  },
}, { prefix = "<leader>g", group_name = "Git" })
