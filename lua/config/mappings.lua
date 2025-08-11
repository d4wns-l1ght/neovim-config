local set_keymaps = require("util").set_keymaps
local key_load = require("util").key_load

local default_virtual_text = vim.diagnostic.config().virtual_text or true
local default_virtual_lines = vim.diagnostic.config().virtual_lines or true

set_keymaps({
	[";"] = {
		function()
			local inline = vim.diagnostic.config().virtual_text
			if inline then
				vim.diagnostic.config({
					virtual_text = false,
					virtual_lines = default_virtual_lines,
				})
			else
				vim.diagnostic.config({
					virtual_text = default_virtual_text,
					virtual_lines = false,
				})
			end
		end,
		"Toggle line diagnostics",
	},
}, { prefix = "<leader>l", group_name = "LSP" })
set_keymaps({
	f = {
		key_load("<leader>f", function()
			vim.cmd([[silent! Lazy load telescope.nvim ]])
		end),
		"Load Telescope",
	},
	o = {
		key_load("<leader>o", function()
			vim.cmd([[silent! Lazy load oil.nvim ]])
		end),
		"Load Oil",
	},
	r = {
		key_load("<leader>r", function()
			vim.cmd([[silent! Lazy load neotest ]])
		end),
		"Load Neotest",
	},
	d = {
		key_load("<leader>s", function()
			vim.cmd([[silent! Lazy load nvim-dap ]])
		end),
		"Load DAP",
	},
	gl = {
		key_load("<leader>gl", function()
			vim.cmd([[silent! Lazy load gitlab.nvim ]])
		end),
		"Load Gitlab",
	},
}, { prefix = "<leader>" })
