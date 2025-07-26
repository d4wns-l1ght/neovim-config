local is_transparent = vim.g.transparent_enabled
return {
  -- transparency
  {
    "xiyaowong/transparent.nvim",
    lazy = true,
    cmd = "TransparentToggle",
    keys = { { "<leader>tt", "<cmd>TransparentToggle<cr>" } },
  },
  -- theme
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      transparent = is_transparent or false,
      custom_highlights = function(colors)
        return {
          LspInlayHint = { bg = colors.none },
          LineNr = { bg = colors.bg, fg = colors.overlay0 },
          GitSignsCurrentLineBlame = { bg = colors.bg, fg = colors.overlay0 },
        }
      end,
    },
  },
  -- Cool-toned
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      transparent = is_transparent or false,
    },
  },
  { "fynnfluegge/monet.nvim" },
  { "folke/tokyonight.nvim" }, -- tokyonight-moon
  { "ray-x/aurora" },
  { "olimorris/onedarkpro.nvim" },
  -- Warm-toned
  { "rebelot/kanagawa.nvim" },
  { "vague2k/vague.nvim" },
  -- less liked/incomplete
  { "mcauley-penney/techbase.nvim", lazy = true },
  { "kaplanz/deku.nvim", lazy = true, dependencies = "rktjmp/lush.nvim" },
}
