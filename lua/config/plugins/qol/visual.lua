return {
  -- makes a little flash whenever the cursor moves
  {
    "DanilaMihailov/beacon.nvim",
    lazy = true,
    event = "BufRead",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    lazy = true,
    event = "BufRead",
    main = "ibl",
    opts = {},
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}
