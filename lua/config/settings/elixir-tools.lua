local elixir = require("elixir")
local elixirls = require("elixir.elixirls")

elixir.setup {
	nextls = { enable = false, },
	elixirls = {
		cmd = "elixirls",
		enable = true,
		settings = {
			dialyzerEnabled = false,
			enableTestLenses = false,
		},
		on_attach = function(client, bufnr)
			vim.keymap.set("n", "<leader>fp", ":<cmd>ElixirFromPipe<CR>", { buffer = true, noremap = true })
			vim.keymap.set("n", "<leader>tp", ":<cmd>ElixirToPipe<CR>", { buffer = true, noremap = true })
		end,
	},
	projectionist = { enbable = true },
}
