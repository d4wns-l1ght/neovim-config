return {
	-- programming stuff
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufRead",
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				opts = {},
			},
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = 'shut-up',
			}
		end,
		config = function()
			require "config.plugins.settings.lsp"
		end,
	},
	-- Treesitter stuff 
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "BufRead",
		build = ":TSUpdate",
		config = function()
			require("config.plugins.settings.treesitter")
		end,
	},
	{
		"folke/todo-comments.nvim",
		lazy = true,
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			highlight = {
				keyword = "fg"
			}
		},
	},
	-- languages {{{
	{
		"mfussenegger/nvim-jdtls",
		lazy = true,
		ft = "java",
	},
	-- Rust
	{
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false -- it's already lazy
	},
	{
		'saecki/crates.nvim',
		lazy = true,
		tag = "stable",
		event = { "BufRead Cargo.toml" },
		opts = require "config.plugins.settings.crates",
	},
	-- Elixir
	{
		"elixir-tools/elixir-tools.nvim",
		version = "*",
		lazy = true,
		ft = "elixir",
		cmd = { "Mix" },
		config = function()
			require "config.plugins.settings.elixir-tools"
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	-- HTTP
	{
		'rest-nvim/rest.nvim',
		lazy = true,
		cmd = 'Rest'
	},
	-- }}}
}
