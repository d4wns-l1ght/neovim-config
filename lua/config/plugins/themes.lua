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
    lazy = true,
    -- lazy = false,
    -- priority = 1000,
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
  { "fynnfluegge/monet.nvim", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim", lazy = true }, -- tokyonight-moon
  { "ray-x/aurora", lazy = true },
  { "olimorris/onedarkpro.nvim", lazy = true },
  { "scottmckendry/cyberdream.nvim", lazy = true },
  -- Warm-toned
  { "rebelot/kanagawa.nvim", lazy = true },
  { "vague2k/vague.nvim", lazy = true },
  -- less liked/incomplete
  { "mcauley-penney/techbase.nvim", lazy = true },
  { "kaplanz/deku.nvim", lazy = true, dependencies = "rktjmp/lush.nvim" },
}
