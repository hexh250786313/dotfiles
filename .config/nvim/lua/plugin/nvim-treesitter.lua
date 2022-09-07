local util = require "formatter.util"

function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local disabler = function(lang, bufnr)
  local rowCount = vim.api.nvim_buf_line_count(bufnr)
  if rowCount > 5000 then
    return true
  end

  local path = util.escape_path(util.get_current_buffer_file_path())
  if file_exists(path) then
    local handle = io.popen("wc -L " .. path)
    local result = handle:read("*a")
    local colCount = tonumber(string.match(result, "^%d+"))
    -- print(colCount)

    handle:close()
    if colCount > 500 then
      return true
    end
  else
    return true
  end
  return false
end

require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = {
    enable = true,
    disable = disabler
  },
  incremental_selection = {
    enable = false,
    disable = disabler
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    disable = disabler
  }
}

vim.keymap.set("n", "<space>tr", ":TSToggle rainbow<cr>", {silent = true})
