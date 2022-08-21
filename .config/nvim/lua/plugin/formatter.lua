local util = require "formatter.util"

local function format_prettierd()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "prettierd",
    args = {
      -- vim.api.nvim_buf_get_name(0)
      util.escape_path(util.get_current_buffer_file_path()) -- util.escape_path 对路径进行字符转义
    },
    stdin = true
  }
end

local function format_prettier()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "prettier",
    args = {
      util.escape_path(util.get_current_buffer_file_path())
    },
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {format_prettierd},
      typescript = {format_prettierd},
      javascript = {format_prettierd},
      javascriptreact = {format_prettierd},
      markdown = {format_prettierd},
      json = {format_prettierd},
      css = {format_prettierd},
      scss = {format_prettierd},
      less = {format_prettierd},
      vue = {format_prettierd},
      lua = {
        function()
          if vim.api.nvim_buf_line_count(0) < 1 then
            return {}
          end
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      zsh = {format_prettier},
      yaml = {format_prettier},
      sh = {format_prettier}
    }
  }
)

vim.cmd([[
nnoremap <silent> <Space>bf :Format<cr>
xnoremap <silent> <Space>bf :Format<cr>
]])

vim.api.nvim_exec(
  [[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.json,*.less,*.scss,*.sass,*.lua,*.vue FormatWrite
augroup END
]],
  true
)
