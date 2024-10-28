return {
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
		"famiu/bufdelete.nvim",
		lazy = true,
		cmd = { "Bdelete", "Bwipeout" },
		keys = {
			{ "<leader>q", "<cmd>Bdelete<CR>", mode = "n", noremap = true, silent = true, desc = "Clear buffer" },
		},
	},
	{
		'folke/trouble.nvim',
		cmd = "Trouble",
		opts = {},
	},
	{
		"mbbill/undotree",
		lazy = true,
		event = "BufRead"
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
	-- Navigation
	{
		"farmergreg/vim-lastplace",
		lazy = true,
		event = "VeryLazy"
	},
	{
		"ggandor/leap.nvim",
		lazy = true,
		event = "BufRead",
		dependencies = { "tpope/vim-repeat"},
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	-- Visual
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require "config.plugins.settings.lualine", -- TODO: customise lualine
		lazy = false,
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
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	-- }}}
}
