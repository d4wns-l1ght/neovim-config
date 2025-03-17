return {
  -- makes a little flash whenever the cursor moves
  {
    "DanilaMihailov/beacon.nvim",
    event = "BufRead",
    opts = {},
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufRead",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = "ibl",
    opts = {},
  },
  { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}
