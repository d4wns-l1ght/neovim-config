require('neo-tree').setup {
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = true,
			hide_gitignored = true,
		},
		follow_current_file = { enabled = true },
	}
}
