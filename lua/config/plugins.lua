return {
	-- programming stuff
	{ "neovim/nvim-lspconfig" },
	-- highlighting
	{ 
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		config = function()
			require "config.settings.treesitter"
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true
	},
	{ 
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},
	-- languages
	{
		"mfussenegger/nvim-jdtls",
		event = "VeryLazy",
	},
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
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		config = function()
			require "config.settings.oil"
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" } 
		}
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" }
	},
	-- git wrapper
	{ "tpope/vim-fugitive", cmd = "Git" },
	-- UI
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require "config.settings.lualine"
		end,
	},
	{ "famiu/bufdelete.nvim" },
	{ 
		"myusuf3/numbers.vim",
		config = function()
			vim.g.numbers_exclude = {"neo-tree","lazy", "oil"}
		end,
	},
	-- QoL
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
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "farmergreg/vim-lastplace" },
}
