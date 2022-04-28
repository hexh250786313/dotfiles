local function format_prettier()
  return {
    exe = "prettierd",
    args = {vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {format_prettier},
      typescript = {format_prettier},
      javascript = {format_prettier},
      javascriptreact = {format_prettier},
      json = {format_prettier},
      css = {format_prettier},
      scss = {format_prettier},
      less = {format_prettier},
      lua = {
        function()
          return {
            exe = "luafmt",
            args = {"--indent-count", 2, "--stdin"},
            stdin = true
          }
        end
      }
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
