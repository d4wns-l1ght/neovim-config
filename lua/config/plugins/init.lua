return {
	-- theme	
	{
		"navarasu/onedark.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'darker',
				term_colors = true,
				colors = {
					light_red = "#d17277",
					light_orange = "#e9c28a",
					light_yellow = "#dfc184",
					light_green = "#a0c180",
					light_blue = "#73ade9",
					light_purple = "#bb7bd7",
					light_cyan = "6fb3bf",
				},
				highlights = {
					["@lsp.type.modifier.java"] = { fg = "$purple" },
					["@type.builtin.java"] = { fg = "$purple" },
					["@lsp.type.parameter.java"] = { fg = "$orange" },
					["@variable.member.java"] = { fg = "$red" },
					["@lsp.typemod.property.private.java"] = { fg = "$red" },


					["@lsp.type.variable.java"] = { fg = "$none" },
					["@lsp.type.property.java"] = { fg = "$none" },
					["@lsp.mod.declaration.java"] = { fg = "$none" },
				},
			}
			require('onedark').load()
		end,
	},
	-- programming stuff
	-- TODO
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = "BufRead",
		dependencies = {
			{ "ms-jpq/coq_nvim", branch = "coq" },
			{ "ms-jpq/coq.artifacts", branch = "artifacts" },
			{
				"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
				config = function()
					require("lsp_lines").setup()
				end,
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
	-- highlighting
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
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy"
	},
	-- languages {{{
	-- TODO: JDTLS
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
		event = { "BufRead Cargo.toml" },
		config = function()
			require('crates').setup()
		end,
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
	-- }}}
	-- theme	
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require('onedark').setup {
				style = 'darker',
				highlights = {
					["@variable.member"] = {fg = "$red" },
					["@variable.parameter"] = { fg = "$cyan" },
				},
				term_colors = true,
			}
			require('onedark').load()
		end,
	},
	-- file system stuff
	{
		"nvim-neo-tree/neo-tree.nvim",
		lazy = true,
		cmd = "Neotree",
		keys = {
			{ "<leader>nt", "<cmd>Neotree toggle focus<CR>", mode = "n", noremap = true, silent = true, desc = "Toggle Neotree" },
			{ "<leader>gt", "<cmd>Neotree float git_status<CR>", mode = "n", noremap = true, silent = true, desc = "Neotree git view" },
			{ "<leader>bt", "<cmd>Neotree toggle buffers focus right<CR>", mode = "n", noremap = true, silent = true, desc = "Toggle Neotree buffer view" },
		},
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim",
		},
		opts = require "config.plugins.settings.neotree",
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = true,
		cmd = "Oil",
		opts = require "config.plugins.settings.oil",
	},
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		cmd = "Telescope",
		keys = {
			{ "<C-o>", "<esc>:Telescope fd<CR>", mode = {"n","i"}, noremap = true, silent = true, desc = "Fzf files" },
			{ "<C-f>", "<esc>:Telescope current_buffer_fuzzy_find<CR>", mode = {"n","i"}, noremap = true, silent = true, desc = "Buffer fzf" },
			{ "<leader>ff", "<cmd>Telescope live_grep<CR>", mode = "n", noremap = true, silent = true },
			{ "<M-CR>", "<cmd>lua vim.lsp.buf.code_action()<CR>", mode = {'n','i'}, noremap = true, silent = true },
		},
		config = function()
			require "config.plugins.settings.telescope"
		end,
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
			{ "nvim-telescope/telescope-ui-select.nvim", },
		}
	},
	-- git stuff
	{
		"tpope/vim-fugitive",
		lazy = true,
		cmd = "G"
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "BufRead",
		opts = {
			signcolumn = true,
			current_line_blame = true
		}
	},
	-- QoL {{{
	-- Informative
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
	-- Functional
	{
		"mbbill/undotree",
		lazy = true,
		event = "VeryLazy"
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = true,
		opts = {
			fast_wrap = {},
		},
	},
	{ "danymat/neogen", opts = {}, keys = "<leader>ng" },
	{
		"farmergreg/vim-lastplace",
		lazy = true,
		event = "VeryLazy"
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat"},
		config = function()
			require("leap").add_default_mappings()
		end,
		event = "VeryLazy"
	},
	-- Visual
	{
		'MeanderingProgrammer/render-markdown.nvim',
		lazy = true,
		ft = { "markdown", "quarto", "org" },
		dependencies = {
			'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'
		},
		opts = {
			render_modes = true,
			heading = {	backgrounds = {} },
			latex = { enabled = false },
		},
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		lazy = true,
		event = "BufRead"
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = true,
		event = "InsertEnter",
		main = "ibl",
		opts = {}
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require "config.plugins.settings.lualine", -- TODO: customise lualine
		lazy = false,
	},
	{
		"famiu/bufdelete.nvim",
		lazy = true,
		cmd = { "Bdelete", "Bwipeout" },
		keys = {
			{ "<leader>q", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
		},
	},
	{
		"akho/numbers.vim",
		lazy = true,
		event = "BufRead",
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
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	-- }}}
}
