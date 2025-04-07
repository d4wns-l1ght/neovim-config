local null_ls = require("null-ls")

null_ls.setup({
  -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.dotenv_linter,
    null_ls.builtins.diagnostics.gitlint,
    null_ls.builtins.diagnostics.hadolint, -- dockerfiles
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "ansi" },
    }),
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.mix,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "ansi" }, -- change to your dialect
    }),
  },
})
