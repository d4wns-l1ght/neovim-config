local Hydra = require("hydra")
local function cmd(command)
  return table.concat({ "<Cmd>", command, "<CR>" })
end
Hydra({
  name = "Windows",
  mode = "n",
  body = "<C-W>",
  config = {
    invoke_on_body = true,
  },
  hint = false,
  heads = {
    -- split windows
    { "s", cmd("split") },
    { "v", cmd("vsplit") },
    { "c", cmd("close") },
    { "o", cmd("only") },
    -- window resizing
    { "=", cmd("wincmd =") },
    { "+", cmd("wincmd +") },
    { "-", cmd("wincmd -") },
    { "<", cmd("wincmd <") },
    { ">", cmd("wincmd >") },
    -- focus window
    { "h", cmd("wincmd h") },
    { "j", cmd("wincmd j") },
    { "k", cmd("wincmd k") },
    { "l", cmd("wincmd l") },
    { "q", nil, { exit = true, nowait = true, desc = false } },
    { "<esc>", nil, { exit = true, nowait = true, desc = false } },
  },
})
Hydra({
  name = "Treewalk",
  mode = { "n", "v" },
  body = "<leader>tw",
  config = {},
  hint = false,
  heads = {
    {
      "h",
      function()
        vim.cmd(":Treewalker Left")
      end,
    },
    {
      "j",
      function()
        vim.cmd(":Treewalker Down")
      end,
    },
    {
      "k",
      function()
        vim.cmd(":Treewalker Up")
      end,
    },
    {
      "l",
      function()
        vim.cmd(":Treewalker Right")
      end,
    },

    -- exit this hydra
    { "q", nil, { exit = true, nowait = true } },
    { "<esc>", nil, { exit = true, nowait = true } },
  },

  -- hint = {
  --   type = "statuslinemanual"
  -- }
})
