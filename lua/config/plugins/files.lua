return {
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
	{
		'sindrets/diffview.nvim',
		lazy = true,
		cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },

	},
}
