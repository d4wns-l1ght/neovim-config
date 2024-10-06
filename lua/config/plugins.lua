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
	{ 
		"navarasu/onedark.nvim",
		config = function()
			require('onedark').setup {
				style = 'darker',
				term_colors = false,
			}
			require('onedark').load()
		end,
	},
	-- file system stuff
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
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" } 
		}
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" }
	},
	-- git wrapper
	{ "tpope/vim-fugitive", cmd = "Git" },
	-- UI/qol
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({global = false})
				end,
				desc = "Buffer local keymaps (which-key)",
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require "config.settings.lualine"
		end,
	},	
	{ 
		"myusuf3/numbers.vim",
		config = function()
			vim.g.numbers_exclude = {"neo-tree","lazy"}
		end,
	},
	{ "farmergreg/vim-lastplace" },
}
