local custom_codedark = require "lualine.themes.codedark"
custom_codedark.normal.a.bg = "#0a7aca"
custom_codedark.normal.a.fg = "#ffffff"
custom_codedark.insert.a.bg = "#ffaf00"
custom_codedark.insert.a.fg = "#1e1e1e"
custom_codedark.visual.a.bg = "#3c3c3c"
custom_codedark.visual.a.fg = "#5cb6f8"
custom_codedark.normal.b.bg = "#373737"
custom_codedark.normal.c.bg = "#373737"

local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end

lualine.setup {
  options = {
    theme = custom_codedark,
    section_separators = {left = "▓░", right = "░▓"},
    component_separators = {left = " ", right = " "}
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"g:coc_git_status"},
    lualine_c = {
      {
        "diff",
        colored = true,
        symbols = {added = "+", modified = "~", removed = "-"}
      },
      {
        "diagnostics",
        sources = {"coc"},
        symbols = {error = "E:", warn = "W:", info = "I:"}
      },
      {
        "b:coc_symbol_line"
      }
      -- {
        -- "filename",
        -- path = 1
      -- }
    },
    lualine_x = {
      "g:coc_status",
      "encoding",
      "filetype"
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  extensions = {"fugitive"}
}
