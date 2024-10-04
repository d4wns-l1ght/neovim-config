return {
	-- programming basics
	{ "neovim/nvim-lspconfig" },
	{ 
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require "config.settings.treesitter"
		end,
	},
	{ "mfussenegger/nvim-dap" },
	-- languages
	{ "mfussenegger/nvim-jdtls" },
	{
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false -- it's already lazy
	},
	-- theme	
	{ "navarasu/onedark.nvim" },
	-- file system stuff
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" } 
		}
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",
		},
		config = function()
			require "config.settings.neotree"
		end,
	},
	-- git
	{ 
		'NeogitOrg/neogit',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'sindrets/diffview.nvim',
			'nvim-telescope/telescope.nvim'
		},
		config = true
	},
	-- UI/qol
	{ 
		"myusuf3/numbers.vim",
		config = function()
			vim.g.numbers_exclude = {"neo-tree","lazy"}
		end,
	},
	{ "farmergreg/vim-lastplace" },
}
