local Hydra = require("hydra")
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
