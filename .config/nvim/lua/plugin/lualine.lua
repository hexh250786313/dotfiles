local vscode = require "lualine.themes.vscode"

local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end

lualine.setup {
  options = {
    theme = vscode,
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
        symbols = {error = "E:", warn = "W:", info = "I:", hint = "H:", ok = "O:"}
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
