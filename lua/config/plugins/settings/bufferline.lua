vim.opt.termguicolors = true
local bufferline = require('bufferline')
bufferline.setup {
	options = {
		style_preset = bufferline.style_preset.no_italic,
		themable = true,
		numbers = 'buffer_id',
		diagnostics = 'nvim_lsp',
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			-- only show icons if not the current buf
			if context.buffer:current() then
				return ''
			end
			local icon = level:match("error") and " " or ""
			return " " .. icon .. count
		end,
		groups = {
			toggle_hidden_on_enter = true,
			-- TODO: Config buf groups as desired
			items = {},
		},
	},
}


