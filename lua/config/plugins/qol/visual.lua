return {
	{
		"nvim-lualine/lualine.nvim",
		event = "UiEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = require("config.plugins.settings.lualine"),
	},
	-- Treesitter stuff
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = { "BufReadPost", "BufWritePost", "BufNewfile", "Filetype" },
		build = ":TSUpdate",
		config = function()
			require("config.plugins.settings.treesitter")
		end,
		dependencies = {
			{ "m-demare/hlargs.nvim" },
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			highlight = {
				keyword = "fg",
			},
		},
	},
	-- For combined relative & absolute line numbers
	{
		"akho/numbers.vim",
		event = "BufRead",
		config = function()
			vim.g.numbers_exclude = {
				"unite",
				"tagbar",
				"startify",
				"gundo",
				"vimshell",
				"w3m",
				"neo-tree",
				"lazy",
			}
			vim.g.numbers_exclude_buffers = {
				"acwrite",
				"help",
				"nofile",
				"nowrite",
				"quickfix",
				"terminal",
				"oil",
			}
		end,
		dependencies = {
			{ "mawkler/hml.nvim", event = "BufRead", opts = {}, enabled = false },
		},
	},
	-- search stuff
	-- Gives more info when searching
	{ "kevinhwang91/nvim-hlslens", event = "BufRead", keys = { "/", "*" }, opts = {} },
	-- Removes search highlights once done
	{ "nvimdev/hlsearch.nvim", lazy = false, opts = {} },
	-- makes a little flash whenever the cursor moves
	{ "HiPhish/rainbow-delimiters.nvim", event = "BufRead" },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		main = "ibl",
		config = function()
			local ibl = require("ibl")
			vim.api.nvim_set_hl(0, "IblScope", {
				fg = vim.api.nvim_get_hl(0, { name = "Normal" }).fg,
			})

			local opts = {
				scope = { enabled = true, show_start = false, show_end = false },
				exclude = {
					filetypes = { "fugitive" },
				},
			}
			ibl.setup(opts)
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = "BufRead",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = { "fugitive", "markdown", "oil", "git", "gitcommit", "gitsigns-blame" },
			})
		end,
	},
	{ "NStefan002/screenkey.nvim", lazy = false, version = "*" },
	{ "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		ft = { "markdown", "quarto", "org" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			render_modes = true,
			heading = { backgrounds = {} },
			latex = { enabled = false },
			completions = { lsp = { enabled = true } },
		},
	},
	{ "norcalli/nvim-colorizer.lua", opts = {} },
}
