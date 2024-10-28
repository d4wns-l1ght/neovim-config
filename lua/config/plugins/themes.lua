return {
  -- theme	
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = 	require "config.plugins.settings.onedark",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },
  {
    'EdenEast/nightfox.nvim'
  },
}
