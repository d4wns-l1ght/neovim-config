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
	{ "mfussenegger/nvim-jdtls" },
	{ "myusuf3/numbers.vim" },
	{ "farmergreg/vim-lastplace" },
	{ "mfussenegger/nvim-dap" }
}
