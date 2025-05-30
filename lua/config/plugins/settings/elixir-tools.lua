local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup({
  nextls = { enable = true },
  elixirls = {
    cmd = "elixir-ls",
    enable = true,
    settings = elixirls.settings({
      dialyzerEnabled = true,
      enableTestLenses = false,
    }),
  },
  projectionist = { enbable = true },
})
