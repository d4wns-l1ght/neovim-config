require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "java",
    "rust",
    "python",
    "markdown",
    "markdown_inline",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "elixir",
    "http",
  },
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
