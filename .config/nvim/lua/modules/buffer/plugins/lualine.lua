-- 配置
local status, lualine = pcall(require, "lualine")
if (not status) then return end

local config = {
  options = {section_separators = {left = "▓░", right = "░▓"}, component_separators = {left = " ", right = " "}},
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"g:coc_git_status"},
    lualine_c = {
      {"diff", colored = true, symbols = {added = "+", modified = "~", removed = "-"}}, {
        "diagnostics",
        sources = {"coc"},
        diagnostics_color = {
          error = "DiagnosticError",
          warn = "DiagnosticWarn",
          info = "DiagnosticInfo",
          hint = "DiagnosticHint"
        },
        symbols = {error = "E:", warn = "W:", info = "I:", hint = "H:", ok = "O:"}
      }, {"filename", path = 1}
    },
    lualine_x = {"g:coc_status", "encoding", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  -- tabline = {
  --   lualine_a = {
  --     {
  --       'buffers',
  --       show_filename_only = true, -- Shows shortened relative path when set to false.
  --       hide_filename_extension = true, -- Hide filename extension when set to true.
  --       show_modified_status = true, -- Shows indicator when the buffer is modified.
  --       mode = 0,
  --       max_length = vim.o.columns * 9 / 10, -- Maximum width of buffers component,
  --       use_mode_colors = false,
  --       buffers_color = {
  --         -- active = 'lualine_a_insert',
  --         active = 'lualine_a_normal',
  --         inactive = 'lualine_a_inactive'
  --       },
  --       symbols = {modified = ' ●', alternate_file = '#', directory = ''}
  --     }
  --   },
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {},
  --   lualine_y = {},
  --   lualine_z = {'tabs'}
  -- },
  extensions = {"fugitive"}
}

local function can_require(path)
  local ok, err = pcall(require, path)
  if ok then return true end
  return false
end

local colorscheme = vim.g.colors_name

if can_require("lualine.themes" .. colorscheme) then config.options.theme = require("lualine.themes" .. colorscheme) end

lualine.setup(config)
