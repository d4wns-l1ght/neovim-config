-- Function from https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#using-external-source-for-diff
--  This lets lualine use gitsigns to get git info
local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

-- This and fmt function from https://github.com/rachartier/dotfiles/blob/main/.config%2Fnvim%2Flua%2Fplugins%2Fui%2Flualine.lua#L159
local kirby_default = "(>*-*)>"
local mode_kirby = {
  n = "<(•ᴗ•)>",
  i = "<(•o•)>",
  v = "(v•-•)v",
  [""] = "(v•-•)>",
  V = "(>•-•)>",
  c = kirby_default,
  no = "<(•ᴗ•)>",
  s = kirby_default,
  S = kirby_default,
  [""] = kirby_default,
  ic = kirby_default,
  R = kirby_default,
  Rv = kirby_default,
  cv = "<(•ᴗ•)>",
  ce = "<(•ᴗ•)>",
  r = kirby_default,
  rm = kirby_default,
  ["r?"] = kirby_default,
  ["!"] = "<(•ᴗ•)>",
  t = "<(•ᴗ•)>",
}

return {
  extensions = {
    "neo-tree",
    "fugitive",
    "lazy",
    "oil",
  },
  -- Statusline
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function()
          return mode_kirby[vim.fn.mode()] or vim.api.nvim_get_mode().mode
        end,
      },
    },
    lualine_b = {
      "filename",
      "branch",
      { "diff", source = diff_source },
    },
    lualine_c = { { "diagnostics", update_in_insert = true } },
    lualine_x = {
      "encoding",
      "filesize",
      "fileformat",
      "filetype",
      function()
        local obsession_status = vim.fn["ObsessionStatus"]()
        return obsession_status or ""
      end,
    },
    lualine_y = { { "datetime", style = "%H:%M %d" }, "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = { { "diff", source = diff_source } },
    lualine_c = { "diagnostics" },
    lualine_x = { { "filetype", icons_enabled = false } },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}
