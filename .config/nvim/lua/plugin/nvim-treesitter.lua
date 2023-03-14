-- local util = require "formatter.util"

local file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- 除了 autocmd 处对大文件进行处理, 这里也不能省略
local disabler = function(lang, bufnr)
  -- local rowCount = vim.api.nvim_buf_line_count(bufnr)
  -- if rowCount > 5000 then
  --   return true
  -- end
  --
  -- local path = util.escape_path(util.get_current_buffer_file_path())
  -- if file_exists(path) then
  --   local handle = io.popen("wc -L " .. path)
  --   local result = handle:read("*a")
  --   local colCount = tonumber(string.match(result, "^%d+"))
  --   -- print(colCount)
  --
  --   handle:close()
  --   if colCount > 500 then
  --     return true
  --   end
  -- else
  --   return false
  -- end
  -- return false

  local max_filesize = 50 * 1024 -- 50 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if ok and stats and stats.size > max_filesize then
    return true
  end
  return false
end

require("nvim-treesitter.configs").setup {
  ensure_installed = {"javascript", "typescript", "css", "scss", "vue", "json", "lua", "vim", "bash", "html"},
  auto_install = true,
  highlight = {
    -- enable = true,
    enable = false,
    disable = disabler
  },
  incremental_selection = {
    enable = false,
    disable = disabler
  }
  -- rainbow = {
  --   enable = true,
  --   extended_mode = true,
  --   disable = disabler
  -- }
}

vim.keymap.set("n", "<space>tr", ":TSToggle rainbow<cr>", {silent = true})
