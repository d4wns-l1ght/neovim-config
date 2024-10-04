return {
	{ "neovim/nvim-lspconfig" },
	{ 
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require "config.settings.treesitter"
		end,
	},
	{ "navarasu/onedark.nvim" },
	{ "mfussenegger/nvim-jdtls" },
	{ 
		"myusuf3/numbers.vim",
		config = function()
			vim.g.numbers_exclude = {"neo-tree"}
		end,
	},
	{ "farmergreg/vim-lastplace" },
	{ "mfussenegger/nvim-dap" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTagim/nui.nvim",
			-- "3rd/image.nvim",
		},
		config = function()
			require "config.settings.neotree"
		end,
	}
}
