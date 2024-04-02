local rainbow = require 'rainbow-delimiters'
local disabler = function(bufnr)
  local max_filesize = 50 * 1024
  local lcount = vim.api.nvim_buf_line_count(bufnr)
  local bytes = vim.api.nvim_buf_get_offset(bufnr, lcount)
  if bytes > max_filesize then
    return true
  end
  return false
end
require('rainbow-delimiters.setup').setup {
  strategy = {
    [''] = function(bufnr)
      local disable = disabler(bufnr)
      if disable == false then
        return rainbow.strategy['global']
      end
      return nil
    end,
  },
}
