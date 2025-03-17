return function()
  vim.g.rustaceanvim = {
    server = {
      on_attach = function(client, bufnr)
        vim.cmd("COQnow --shut-up")
        local set_keymaps = require("util").set_keymaps

        set_keymaps({
          a = {
            function()
              vim.cmd.RustLsp("codeAction")
            end,
            "Code action",
          },
        }, { prefix = "<leader>l", group_name = "LSP", buffer = bufnr })
        set_keymaps({
          d = {
            function()
              vim.cmd.RustLsp("debuggables")
            end,
            "Debuggables",
          },
          e = {
            function()
              vim.cmd.RustLsp("explainError")
            end,
            "Explain error",
          },
          j = {
            function()
              vim.cmd.RustLsp("joinLines")
            end,
            "Join lines",
          },
          m = {
            function()
              vim.cmd.RustLsp("expandMacro")
            end,
            "Expand macro",
          },
          r = {
            function()
              vim.cmd.RustLsp("runnables")
            end,
            "Runnables",
          },
          s = {
            function()
              vim.cmd.RustLsp("renderDiagnostic")
            end,
            "Render diagnostic",
          },
        }, { mode = { "n", "v" }, group_name = "Rust", prefix = "<leader>ll", buffer = bufnr })
        -- Hover depending on mode
        set_keymaps({
          K = {
            function()
              vim.cmd.RustLsp({ "hover", "actions" })
            end,
            "LSP Hover",
          },
        }, { mode = { "n" }, buffer = bufnr })

        set_keymaps({
          K = {
            function()
              vim.cmd.RustLsp({ "hover", "range" })
            end,
            "LSP Hover",
          },
        }, { mode = { "v" }, buffer = bufnr })
      end,
    },
  }
end
