-- Lualine theme
-- Put it under lualine.nvim/lua/lualine/themes/ and then set options.theme to
-- 'nvim-grey'

local colors = {
  pink = "#5c21a5",
  red = "#c4331d",
  green = "#1C5708",
  violet = "#646695",
  white = "#ffffff",
  black = "#000000",
  fg = "#7f7f7f",
  lightgray = "#d9d9d9",
  grey = "#cfcfcf",
}

return {
  normal = {
    a = { fg = colors.fg, bg = colors.grey },
    b = { fg = colors.fg, bg = colors.lightgray },
    c = { fg = colors.fg, bg = colors.lightgray },
  },
  insert = {
    a = { fg = colors.white, bg = colors.green },
  },
  visual = {
    a = { fg = colors.white, bg = colors.black },
  },
  replace = {
    a = { fg = colors.white, bg = colors.pink },
  },
  command = {
    a = { fg = colors.white, bg = colors.black },
  },
  terminal = {
    a = { fg = colors.fg, bg = colors.grey },
  },
  pending = {
    a = { fg = colors.white, bg = colors.red },
  },
  inactive = {
    a = { fg = colors.fg, bg = colors.grey },
  },
}
