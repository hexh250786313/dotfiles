local Path = require("plenary.path")
local fn = vim.fn
local api = vim.api
local utils = require("telescope.utils")

local function is_coc_ready(feature)
  if vim.g.coc_service_initialized ~= 1 then
    -- print("Coc is not ready!")
    return
  end

  if feature and not fn.CocHasProvider(feature) then
    print("Coc: server does not support " .. feature)
    return
  end

  return true
end

require("bufferline").setup {
  options = {
    -- separator_style = "padded_slant",
    -- separator_style = {"░", "░"},
    -- separator_style = {">", "<"},
    -- separator_style = {"", ""},
    -- separator_style = {"  ", "  "},
    -- separator_style = {"░▓", "▓░"},
    separator_style = {"", ""},
    -- diagnostics = "coc",
    -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
    -- local icon = level:match("error") and " " or " "
    -- return " " .. icon .. count
    -- end,
    indicator_icon = "▌",
    -- max_name_length = 18,
    max_prefix_length = 100,
    custom_filter = function(buf_number, buf_numbers)
      -- return true
      -- 当前 buffer 返回 true
      if vim.fn.bufname(buf_number) == vim.fn.expand("%") then
        return true
      end
      -- print(vim.fn.expand('%'))
      -- print(vim.fn.bufname(buf_number) == vim.fn.expand('%:p'))
      -- print(vim.fn.bufname(buf_number))
      -- filter out filetypes you don't want to see
      -- if vim.bo[buf_number].filetype == "qqk" then
      -- return true
      -- end
      -- -- filter out by buffer name:p
      -- if vim.fn.bufname(buf_number) == "qqk" then
      -- return true
      -- end
      -- local qq = vim.b.coc_git_status
      -- print(qq);
      -- local result = vim.fn.systemlist("git diff-tree --no-commit-id --name-only -r HEAD")
      -- for k, v in pairs(result) do
      -- result[k] = "  " .. result[k]
      -- print(result[k])
      -- end
      -- api.nvim_buf_set_lines(buf, 0, -1, false, result)
      -- local pipe = io.popen('git status --porcelain -uall')
      -- vim.defer_fn(function()
      -- pipe:flush()
      -- pipe:close()
      -- end, 1000)
      if not is_coc_ready() then
        return true
      end
      local home = vim.call("coc#util#get_data_home")
      local data = Path:new(home .. Path.path.sep .. "mru"):read()
      local results = {}
      if not data or #data == 0 then
        return
      end
      local cwd = vim.loop.cwd() .. Path.path.sep
      for index, val in ipairs(utils.max_split(data, "\n")) do
        if index > 5 then
          return
        end
        local p = Path:new(val)
        local lowerPrefix = val:sub(1, #cwd):gsub(Path.path.sep, ""):lower()
        local lowerCWD = cwd:gsub(Path.path.sep, ""):lower()
        if lowerCWD == lowerPrefix and p:exists() and p:is_file() then
          if vim.fn.bufname(buf_number) == val:sub(#cwd + 1) then
            return true
          end
        end
      end
      -- filter out based on arbitrary rules
      -- e.g. filter out vim wiki buffer from tabline in your work repo
      -- if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
      -- return true
      -- end
      -- filter out by it's index number in list (don't show first buffer)
      -- if buf_numbers[1] ~= buf_number then
      -- return true
      -- end
    end
  },
  highlights = {
    fill = {
      guibg = "#373737"
    },
    group_separator = {
      guibg = "#373737"
    },
    group_label = {
      guibg = "#373737"
    },
    tab = {
      guibg = "#373737"
    },
    tab_selected = {
      guibg = "#0a7aca"
    },
    tab_close = {
      guibg = "#373737"
    },
    close_button = {
      guibg = "#373737"
    },
    close_button_selected = {
      guibg = "#0a7aca",
      guifg = "#ffffff"
    },
    buffer_selected = {
      guibg = "#0a7aca",
      guifg = "#ffffff"
    },
    background = {
      guibg = "#373737"
    },
    buffer = {
      guibg = "#373737"
    },
    diagnostic = {
      guibg = "#373737"
    },
    diagnostic_selected = {
      guibg = "#0a7aca"
    },
    hint = {
      guibg = "#373737"
    },
    hint_selected = {
      guibg = "#0a7aca"
    },
    hint_diagnostic = {
      guibg = "#373737"
    },
    hint_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    info = {
      guibg = "#373737"
    },
    info_selected = {
      guibg = "#0a7aca"
    },
    info_diagnostic = {
      guibg = "#373737"
    },
    info_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    warning_selected = {
      guibg = "#0a7aca"
    },
    warning = {
      guibg = "#373737"
    },
    warning_diagnostic = {
      guibg = "#373737"
    },
    warning_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    error = {
      guibg = "#373737"
    },
    error_diagnostic = {
      guibg = "#373737"
    },
    error_selected = {
      guibg = "#0a7aca"
    },
    error_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    modified = {
      guibg = "#373737"
    },
    modified_selected = {
      guibg = "#0a7aca"
    },
    duplicate = {
      gui = "italic",
      guibg = "#373737"
    },
    duplicate_selected = {
      guibg = "#0a7aca",
      guifg = "#ffaf00"
    },
    separator_selected = {
      guifg = "#373737",
      guibg = "#0a7aca"
    },
    separator_visible = {
      guifg = "#373737"
      -- guibg = visible_bg,
    },
    separator = {
      guifg = "#373737",
      guibg = "#373737"
    },
    indicator_selected = {
      guibg = "#0a7aca"
    },
    pick = {
      guibg = "#373737",
      gui = "bold,italic"
    },
    pick_selected = {
      guibg = "#0a7aca"
    }
  }
}
