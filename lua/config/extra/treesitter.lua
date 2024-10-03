require("nvim-treesitter.configs").setup {
	ensure_installed = { "java", "rust", "python", "markdown", "markdown_inline", "lua", "vim", "vimdoc", "query" },
	auto_install = true,
	highlight = { enable = true },
}
