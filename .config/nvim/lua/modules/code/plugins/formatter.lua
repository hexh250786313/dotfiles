local util = require "formatter.util"

---------> 快捷键
local wk = require("which-key")
wk.register({ mode = { "n" }, ["<leader>cf"] = { "<cmd>Format<cr>", "Format code" } })
wk.register({
  mode = { "x" },
  ["<leader>cf"] = { ":'<,'>Format<cr><esc>", "Format code" }, -- 这里不要用 <cmd>
})

---------> 配置
local function format_prettier()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return {
    exe = "prettier",
    args = {
      '--stdin-filepath',
      util.escape_path(util.get_current_buffer_file_path()),
      -- util.escape_path(util.get_current_buffer_file_path())
    },
    stdin = true,
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
      util.escape_path(util.get_current_buffer_file_path()), -- util.escape_path 对路径进行字符转义
    },
    stdin = true,
  }
end

local function format_taplo()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return { exe = "taplo", args = { "fmt", "-" }, stdin = true }
end

local function format_nginxfmt()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return { exe = "nginxfmt", args = { "-p", "-" }, stdin = true }
end

local function format_rustfmt()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end

  return { exe = "rustfmt", stdin = true }
end

local function format_lua()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end
  return {
    exe = "lua-format",
    args = { "--config", "~/.config/nvim/_self/lang-configs/lua/formatter.conf" },
    stdin = true,
  }
end

local function format_pg()
  if vim.api.nvim_buf_line_count(0) < 1 then
    return {}
  end
  return { exe = "pg_format", args = { "-" }, stdin = true }
end

require("formatter").setup({
  logging = true,
  filetype = {
    html = { format_prettierd },
    typescriptreact = { format_prettierd },
    typescript = { format_prettierd },
    javascript = { format_prettierd },
    javascriptreact = { format_prettierd },
    markdown = { format_prettierd },
    json = { format_prettierd },
    jsonc = { format_prettierd },
    css = { format_prettierd },
    scss = { format_prettierd },
    less = { format_prettierd },
    vue = { format_prettierd },
    nginx = { format_nginxfmt },
    toml = { format_taplo },
    rust = { format_rustfmt },
    lua = { format_lua },
    sql = { format_pg },
    zsh = { format_prettier },
    yaml = { format_prettier },
    sh = { format_prettier },
  },
})
