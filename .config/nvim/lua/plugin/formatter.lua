local util = require "formatter.util"

local function format_prettierd()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

local function format_prettier()
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
      json = {format_prettierd},
      css = {format_prettierd},
      scss = {format_prettierd},
      less = {format_prettierd},
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      },
      zsh = {format_prettier},
      yaml = {format_prettier}
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
  autocmd BufWritePost *.ts,*.tsx,*.js,*.jsx,*.json,*.less,*.scss,*.sass,*.lua FormatWrite
augroup END
]],
  true
)
