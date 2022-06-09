local status, lualine = pcall(require, "lualine")
if (not status) then
  return
end

local config = {
  options = {
    -- theme = theme,
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

local function can_require(path)
  local ok, err = pcall(require, path)
  if ok then
    return true
  end
  return false
end

local colorscheme = vim.g.colors_name

if can_require("lualine.themes" .. colorscheme) then
  config.options.theme = require("lualine.themes" .. colorscheme)
end

lualine.setup(config)
