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
  c = {
    function()
      vim.cmd("Telescope cmdline")
    end,
    "Command line",
  },
  d = { telebuilt.diagnostics, "Diagnostics" },
  f = { telebuilt.live_grep, "Live grep" },
  h = { telebuilt.help_tags, "Help tags" },
  j = { telebuilt.jumplist, "Jump list" },
  l = { telebuilt.loclist, "Location list" },
  m = { telebuilt.man_pages, "Man pages" },
  o = { require("cd-project.adapter").cd_project, "Search projects" },
  p = { telebuilt.oldfiles, "Previous files" },
  q = { telebuilt.quickfix, "Quickfix" },
  Q = { telebuilt.quickfixhistory, "Quickfix History" },
  r = { telebuilt.registers, "Registers" },
  s = { telebuilt.treesitter, "Treesitter symbols" },
  t = { vim.cmd.TodoTelescope, "Find TODOs" },
  w = { telebuilt.grep_string, "Find word" },
}, { prefix = "<leader>f", group_name = "Telescope" })

set_keymaps({
  b = { telebuilt.git_branches, "Branches" },
  c = { telebuilt.git_commits, "Commits" },
  s = { telebuilt.git_commits, "Stashes" },
  C = { telebuilt.git_bcommits, "Current buffer commits" },
}, { prefix = "<leader>fg", group_name = "Telescope Git" })

local easypick = require("easypick")
local get_default_branch = "git remote show -n origin | rg 'HEAD branch' | cut -d' ' -f5"
local base_branch = vim.fn.system(get_default_branch) or "main"
local pickers = {
  {
    name = "conflicts",
    command = "git diff --name-only --diff-filter=U --relative",
    previewer = easypick.previewers.file_diff(),
  },
  {
    name = "changed_files",
    command = "git diff --name-only $(git merge-base HEAD " .. base_branch .. " )",
    previewer = easypick.previewers.branch_diff({ base_branch = base_branch }),
  },
}

easypick.setup({
  pickers = pickers,
})

set_keymaps({
  c = {
    easypick.conflicts,
    "Git conflicts",
  },
  d = {
    easypick.changed_files,
    "Base branch diffs",
  },
}, { prefix = "<leader>fe", group_name = "Easypick" })
