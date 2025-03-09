local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("rustaceanvim.neotest"),
  },
})

local set_keymaps = require("util").set_keymaps
set_keymaps({
  r = { neotest.run.run, "Run test" },
  R = {
    function()
      neotest.run.run(vim.fn.expand("%"))
    end,
    "Run file",
  },
  w = { neotest.watch.toggle, "Watch test" },
  W = {
    function()
      neotest.watch.toggle(vim.fn.expand("%"))
    end,
    "Watch file",
  },
  o = { neotest.summary.toggle, "Toggle summary" },
  s = { neotest.run.stop, "Stop test" },
  a = { neotest.run.attach, "Attach to test" },
  t = {
    function()
      neotest.output.open({ short = true })
    end,
    "Open test output",
  },
  T = { neotest.output.open, "Open full output" },
}, { prefix = "<leader>r", group_name = "Neotest " })
