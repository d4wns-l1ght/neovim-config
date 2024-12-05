local dap = require("dap")

dap.adapters.mix_task = {
  type = 'executable',
  command = '/opt/homebrew/Cellar/elixir-ls/0.24.1/libexec/debug_adapter.sh',
  args = {}
}

dap.configurations.elixir = {
  {
    type = "mix_task",
    name = "mix test",
    task = 'test',
    taskArgs = {"--trace"},
    request = "launch",
    startApps = true, -- for Phoenix projects
    projectDir = "${workspaceFolder}",
    requireFiles = {
      "test/**/test_helper.exs",
      "test/**/*_test.exs"
    }
  },
}
