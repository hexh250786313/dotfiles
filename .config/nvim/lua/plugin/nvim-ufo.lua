vim.wo.foldcolumn = "0"
vim.wo.foldlevel = 99
vim.wo.foldenable = true

local handler = function(virtText, lnum, endLnum, width)
  local newVirtText = {}
  local endText = ("  %d "):format(endLnum - lnum)
  local limitedWidth = width - vim.api.nvim_strwidth(endText)
  local pos = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local nextPos = pos + #chunkText
    if limitedWidth > nextPos then
      table.insert(newVirtText, chunk)
    else
      chunkText = chunkText:sub(1, limitedWidth - pos)
      local hlGroup = chunk[2]
      table.insert(newVirtText, {chunkText, hlGroup})
      break
    end
    pos = nextPos
  end
  table.insert(newVirtText, {endText, "Folded"})
  return newVirtText
end

-- global handler
require("ufo").setup(
  {
    fold_virt_text_handler = handler
  }
)

-- local bufnr = vim.api.nvim_get_current_buf()
-- require("ufo").setVirtTextHandler(bufnr, handler)
