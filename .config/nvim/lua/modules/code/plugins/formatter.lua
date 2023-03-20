local util = require "formatter.util"

---------> 快捷键
local wk = require("which-key")
wk.register(
  {
    mode = {"n", "x"},
    ["<leader>cf"] = {"<cmd>Format<cr>", "Format code"},
  }
)

---------> 配置
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

local function format_prettierd()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  local current_bufnr = vim.api.nvim_get_current_buf()
  local max_filesize = 50 * 1024 -- 50 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(current_bufnr))
  if ok and stats and stats.size > max_filesize then
    return format_prettier()
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
      sql = {
        function()
          return {
            exe = "pg_format",
            args = {
              "-"
            },
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

