-- See nvim_create_user_command({name}, {command}, {*opts})

local cmd = vim.api.nvim_create_user_command


local lightdark = { "dawnfox", "duskfox" }

local toggletheme = function()
  if vim.g.colors_name == lightdark[1] then
    vim.cmd("colorscheme "..lightdark[2])
  elseif vim.g.colors_name == lightdark[2] then
      vim.cmd("colorscheme "..lightdark[1])
  end
end
cmd("TT", toggletheme, {} )
