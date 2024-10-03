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
	{ 
		"myusuf3/numbers.vim",
		numbers_exclude = {"Neotree", "filesystem","neo-tree", "Neotree.neo-tree"}
	},
	{ "farmergreg/vim-lastplace" },
	{ "mfussenegger/nvim-dap" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	}
}
