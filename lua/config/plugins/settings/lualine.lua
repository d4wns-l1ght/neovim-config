-- Function from https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff
--  This lets lualine use gitsigns to get git info
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

return {
	options = {
		theme = 'onedark',
		global_status = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {
			'filename',
			'branch',
			{'diff', source = diff_source }
		},
		lualine_c = { {'diagnostics', update_in_insert = true} },
		lualine_x = { 'encoding', 'filesize', 'fileformat', 'filetype'},
		lualine_y = { {'datetime', style="%H:%M %d"}, 'progress' },
		lualine_z = {'location'},
	},
	extensions = {
		'neo-tree', 'fugitive', 'lazy', 'oil', 'trouble',
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = { { "diff", source = diff_source } },
		lualine_c = { "diagnostics" },
		lualine_x = { { "filetype", icons_enabled = false } },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	}
}
