function format_prettier()
  return {
    exe = "prettierd",
    -- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
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
        -- luafmt
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
