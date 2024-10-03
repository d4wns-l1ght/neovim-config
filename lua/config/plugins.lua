return {
	{ "neovim/nvim-lspconfig" },
	{ 
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require "config.extra.treesitter"
		end,
	},
	{ "navarasu/onedark.nvim" },
	{ "mfussenegger/nvim-jdtls" }
}
