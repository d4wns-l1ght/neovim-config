return {
	-- programming stuff
	-- TODO
	{ 
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
		},
		init = function()
			vim.g.coq_settings = {
				auto_start = 'shut-up',
			}
		end,
	},
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	},
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
		opts = {
			highlight = {
				keyword = "fg"
			}
		},
		event = "VeryLazy"
	},
	{ 
		"mfussenegger/nvim-dap",
		event = "VeryLazy"
	},
	-- languages
	-- TODO: JDTLS
	{
		"mfussenegger/nvim-jdtls",
	},
	-- Rust
	{
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false -- it's already lazy
	},
	{
		'saecki/crates.nvim',
		event = { "BufRead Cargo.toml" },
		config = function()
			require('crates').setup()
		end,
	},
	-- theme	
	{ 
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
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
		lazy = true,
		cmd = "Neotree",
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
		cmd = "Oil",
		config = function()
			require "config.settings.oil"
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		branch = "0.1.x",
		dependencies = { 
			"nvim-lua/plenary.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" } 
		}
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" }
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	-- git wrapper
	{ 
		"tpope/vim-fugitive", 
		lazy = true,
		cmd = "G" 
	},
	-- UI
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require "config.settings.lualine"
		end,
		lazy = false,
	},
	{ "famiu/bufdelete.nvim" },
	{ 
		"akho/numbers.vim",
		config = function()
			vim.g.numbers_exclude = {
				'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', --superset
				"neo-tree","lazy", "oil"
			}
			vim.g.numbers_exclude_buffers = {
				'acwrite', 'help', 'nofile', 'nowrite', 'quickfix', 'terminal'
			}
		end,
	},
	-- QoL
	{
		"folke/which-key.nvim",
		lazy = true,
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
		"mbbill/undotree",
		lazy = true,
		event = "VeryLazy" 
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = true,
		config = true,
	},
	{ 
		"farmergreg/vim-lastplace",
		lazy = true,
		event = "VeryLazy"
	},
	{ 
		"HiPhish/rainbow-delimiters.nvim",
		lazy = true,
		event = "VeryLazy"
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {}
	},
}
