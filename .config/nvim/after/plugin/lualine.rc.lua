local custom_codedark = require'lualine.themes.codedark'
custom_codedark.normal.a.bg = '#0a7aca'
custom_codedark.normal.a.fg = '#ffffff'
custom_codedark.insert.a.bg = '#ffaf00'
custom_codedark.insert.a.fg = '#1e1e1e'
custom_codedark.visual.a.bg = '#3c3c3c'
custom_codedark.visual.a.fg = '#5cb6f8'
custom_codedark.normal.b.bg = '#373737'
custom_codedark.normal.c.bg = '#373737'

local gps = require("nvim-gps")

local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
  -- options = {
    -- icons_enabled = true,
    -- theme = 'solarized_dark',
    -- component_separators = {left = '', right = ''},
    -- section_separators = {left = '', right = ''},
    -- disabled_filetypes = {}
  -- },
  -- sections = {
    -- lualine_a = {'mode'},
    -- lualine_b = {'branch'},
    -- lualine_c = {{
      -- 'filename',
      -- file_status = true, -- displays file status (readonly status, modified status)
      -- path = 2 -- 0 = just filename, 1 = relative path, 2 = absolute path
    -- }},
    -- lualine_x = {
      -- 'encoding',
      -- 'filetype'
    -- },
    -- lualine_y = {'progress'},
    -- lualine_z = {'location'}
  -- },
  -- inactive_sections = {
    -- lualine_a = {},
    -- lualine_b = {},
    -- lualine_c = {{
      -- 'filename',
      -- file_status = true, -- displays file status (readonly status, modified status)
      -- path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    -- }},
    -- lualine_x = {'location'},
    -- lualine_y = {},
    -- lualine_z = {}
  -- },
  -- tabline = {},
  -- extensions = {'fugitive'}
  options = {
    -- theme = 'solarized_dark',
    theme = custom_codedark,
    -- section_separators = {left = ' ', right = ' '},
    section_separators = {left = '▓░', right = '░▓'},
    component_separators = {left = ' ', right = ' '},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'g:coc_git_status'},
    lualine_c = {
      {
        'diff',
        colored = true,
        symbols = {added = '+', modified = '~', removed = '-'}
      },
      {
        'diagnostics',
        sources = {'coc'},
        symbols = {error = 'E:', warn = 'W:', info = 'I:'}
      },
      -- {treelocation}
      -- { gps.get_location, cond = gps.is_available },
    },
    lualine_x = {
      'lsp_progress',
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = {'fugitive'},
  tabline = {
    -- lualine_a = {
      -- {
        -- 'buffers',
        -- show_filename_only = true,
        -- mode = 2,
        -- max_length = vim.o.columns * 1 / 2,
        -- -- max_length = vim.o.columns,
      -- }
    -- },
    -- lualine_b = {},
    -- lualine_c = {},
    -- lualine_x = {},
    -- lualine_y = {
      -- {
        -- 'filename',
        -- path = 1
      -- },
    -- },
    -- lualine_z = {'tabs'}
    lualine_a = {
      {
        'tabs',
        mode = 2,
      }
    },
    lualine_b = {
      {
        'filename',
        path = 1
      },
    },
  }
}


