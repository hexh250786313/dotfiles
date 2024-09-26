-- 配置
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

local colors = {
  background = vim.fn.synIDattr(vim.fn.hlID("StatusLine"), "bg", "gui"),
  error = vim.fn.synIDattr(vim.fn.hlID("DiagnosticError"), "fg", "gui"),
  hint = vim.fn.synIDattr(vim.fn.hlID("DiagnosticHint"), "fg", "gui"),
  info = vim.fn.synIDattr(vim.fn.hlID("DiagnosticInfo"), "fg", "gui"),
  warn = vim.fn.synIDattr(vim.fn.hlID("DiagnosticWarn"), "fg", "gui"),
}

local colorscheme = vim.g.colors_name

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
  self.status = ""
  self.applied_separator = ""
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- 设置每个项之间的分隔
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < "x"
    for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.background, bg = colors.background } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= "table" then
        comp = { comp }
        section[id] = comp
      end
      -- comp.separator = left and { right = '' } or { left = '' }
      comp.separator = left and { right = "▓▒░" } or { left = "░▒▓" }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ""
  end
  local last_search = vim.fn.getreg("/")
  if not last_search or last_search == "" then
    return ""
  end
  local searchcount = vim.fn.searchcount({ maxcount = 9999 })
  return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local config = {
  options = {
    disabled_filetypes = { "qf" },
    -- 原创渐变
    -- section_separators = { left = "▓░", right = "░▓" },
    -- component_separators = { left = " ", right = " " },
    -- 斜主题
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  -- 如果不想要斜分割，就去掉 process_sections
  -- sections = process_sections {
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          -- 定义模式到字符的映射
          local mode_map = {
            ["NORMAL"] = "N",
            ["INSERT"] = "I",
            ["VISUAL"] = "V",
            ["V-LINE"] = "VL",
            ["V-BLOCK"] = "VB",
            ["SELECT"] = "S",
            ["REPLACE"] = "R",
            ["COMMAND"] = "C",
            -- 改成 NerdFont 图标更好看
            -- ['NORMAL'] = '',
            -- ['INSERT'] = '',
            -- ['VISUAL'] = '',
            -- ['V-LINE'] = '',
            -- ['V-BLOCK'] = '',
            -- ['SELECT'] = '',
            -- ['REPLACE'] = '',
            -- ['COMMAND'] = '',
          }
          -- 返回映射后的字符，如果没有找到映射，则返回原字符串
          return mode_map[str] or str
        end,
      },
    },
    lualine_b = {
      { "g:coc_git_status" },
      { "diff", colored = true, symbols = { added = "+", modified = "~", removed = "-" } }, -- 不知道为什么一保存就消失
      {
        "diagnostics",
        sources = { "coc" },
        diagnostics_color = {
          -- error = "DiagnosticError",
          -- warn = "DiagnosticWarn",
          -- info = "DiagnosticInfo",
          -- hint = "DiagnosticHint",
          error = { bg = colors.error, fg = colors.background },
          warn = { bg = colors.warn, fg = colors.background },
          info = { bg = colors.info, fg = colors.background },
          hint = { bg = colors.hint, fg = colors.background },
        },
        symbols = {
          -- error = "E:",
          -- warn = "W:",
          -- info = "I:",
          -- hint = "H:",
          -- ok = "O:"
          -- 改成 NerdFont 版本更好看
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
          ok = " ",
        },
      },
      -- { "filename", path = 4 },
    },
    lualine_c = {},
    lualine_x = { "g:coc_status", "encoding", search_result, "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
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
  winbar = {
    lualine_a = { { "filename", path = 1 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {
      {
        "buffers",
        show_filename_only = true, -- Shows shortened relative path when set to false.
        -- hide_filename_extension = true, -- Hide filename extension when set to true.
        show_modified_status = true, -- Shows indicator when the buffer is modified.
        mode = 0,
        max_length = vim.o.columns * 9 / 10, -- Maximum width of buffers component,
        use_mode_colors = false,
        buffers_color = {
          -- active = 'lualine_a_insert',
          active = "lualine_a_normal",
          inactive = "lualine_a_inactive",
        },
        symbols = { modified = " ●", alternate_file = "[A] ", directory = "" },
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_winbar = {
    lualine_a = { { "filename", path = 1 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "fugitive" },
}

local function can_require(path)
  local ok, err = pcall(require, path)
  if ok then
    return true
  end
  return false
end

if can_require("lualine.themes." .. colorscheme) then
  local theme = require("lualine.themes." .. colorscheme)
  if not theme.command then
    theme.command = {}
  end
  theme.command.a = theme.normal.a
  theme.command.b = theme.normal.b

  if not theme.terminal then
    theme.terminal = {}
  end
  theme.terminal.a = theme.normal.a
  config.options.theme = theme
end

lualine.setup(config)
