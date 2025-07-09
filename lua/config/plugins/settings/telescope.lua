local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = vim.tbl_extend(
    "force",
    require("telescope.themes").get_ivy({
      layout_config = { height = 12 },
    }),
    {
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-k>"] = "move_selection_previous",
          ["<C-j>"] = "move_selection_next",
          ["<C-h>"] = "which_key",
        },
      },
    }
  ),
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")
telescope.load_extension("cmdline")
telescope.load_extension("conflicts")
telescope.load_extension("git_diffs")
telescope.load_extension("helpgrep")
telescope.load_extension("lazy")
telescope.load_extension("messages")
telescope.load_extension("undo")

local telebuilt = require("telescope.builtin")
local set_keymaps = require("util").set_keymaps
set_keymaps({
  ["."] = { telebuilt.find_files, "Find files" },
  [","] = {
    function()
      telebuilt.find_files({ no_ignore = true, no_ignore_parent = true, hidden = true })
    end,
    "Find all files",
  },
  ["/"] = { telebuilt.current_buffer_fuzzy_find, "Fuzzy find" },
  a = { telebuilt.builtin, "Telescope builtins" },
  b = { telebuilt.buffers, "Find buffers" },
  c = { telescope.extensions.cmdline.cmdline, "Command line" },
  d = { telebuilt.diagnostics, "Diagnostics" },
  f = { telebuilt.live_grep, "Live grep" },
  h = { telebuilt.help_tags, "Help tags" },
  H = { telescope.extensions.helpgrep.helpgrep, "Grep help pages" },
  j = { telebuilt.jumplist, "Jump list" },
  k = { telebuilt.keymaps, "Keymaps" },
  l = { telebuilt.loclist, "Location list" },
  m = { telebuilt.man_pages, "Man pages" },
  M = { telescope.extensions.messages.messages, "Messages" },
  o = { require("cd-project.adapter").cd_project, "Search projects" },
  p = { telebuilt.oldfiles, "Previous files" },
  P = { telescope.extensions.lazy.lazy, "Lazy plugins" },
  q = { telebuilt.quickfix, "Quickfix" },
  Q = { telebuilt.quickfixhistory, "Quickfix history" },
  r = { telebuilt.resume, "Resume last action" },
  R = { telebuilt.registers, "Registers" },
  s = { telebuilt.treesitter, "Treesitter symbols" },
  t = { vim.cmd.TodoTelescope, "Find TODOs" },
  u = { telescope.extensions.undo.undo, "Undotree" },
  w = { telebuilt.grep_string, "Find word" },
}, { prefix = "<leader>f", group_name = "Telescope" })

set_keymaps({
  e = {
    function()
      telebuilt.symbols({ sources = { "emoji" } })
    end,
    "Emojis",
  },
  k = {
    function()
      telebuilt.symbols({ sources = { "kaomoji" } })
    end,
    "Kaomoji",
  },
  m = {
    function()
      telebuilt.symbols({ sources = { "latex" } })
    end,
    "Math/Latex",
  },
}, { prefix = "<leader>fe", group_name = "Symbols" })

set_keymaps({
  b = { telebuilt.git_branches, "Branches" },
  c = { telebuilt.git_commits, "Commits" },
  C = { telebuilt.git_bcommits, "Current buffer commits" },
  d = { telescope.extensions.git_diffs.diff_commits, "diffs" },
  s = { telebuilt.git_status, "Status" },
  S = { telebuilt.git_commits, "Stashes" },
  x = { telescope.extensions.conflicts.conflicts, "Conflicts" },
}, { prefix = "<leader>fg", group_name = "Telescope Git" })
