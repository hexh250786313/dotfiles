function format_prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
    stdin = true
  }
end

require("formatter").setup {
  logging = true,
  filetype = {
    typescript = {format_prettier},
    typescriptreact = {format_prettier}
  }
}

require("formatter").setup(
  {
    logging = true,
    filetype = {
      typescriptreact = {format_prettier},
      typescript = {format_prettier},
      javascript = {format_prettier},
      javascriptreact = {format_prettier},
      json = {format_prettier},
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
