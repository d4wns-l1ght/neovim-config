local dap = require("dap")
local keymap = require("util").set_keymaps
local dapui = require("dapui")

dap.adapters.mix_task = {
  type = "executable",
  command = "/opt/homebrew/Cellar/elixir-ls/0.24.1/libexec/debug_adapter.sh",
  args = {},
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = "test",
    taskArgs = { "--trace" },
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs",
    },
  },
}

keymap({
  b = { dap.toggle_breakpoint, "Toggle breakpoint" },
  B = {
    function()
      dap.list_breakpoints(true)
    end,
    "List breakpoints",
  },
  u = { dapui.toggle, "Toggle UI" },
  e = { dap.set_exception_breakpoints, "Set exception breakpoints" },
  D = { dap.clear_breakpoints, "Clear breakpoints" },
  c = { dap.continue, "Continue" },
  s = { dap.step_over, "Step" },
  i = { dap.step_into, "Step in" },
  o = { dap.step_out, "Step out" },
  r = { dap.repl.toggle, "Toggle REPL" },
  h = { dap.run_to_cursor, "Run to cursor" },
  ["<Up>"] = { dap.up, "Stacktrace up" },
  ["<Down>"] = { dap.down, "Stacktrace down" },
  k = {
    function()
      dap.disconnect()
      dap.close()
    end,
    "Stop debugging",
  },
}, { prefix = "<leader>d", group_name = "DAP" })
