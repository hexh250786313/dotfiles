vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
-- vim.o.foldlevelstart = -1
vim.o.foldlevelstart = 99
vim.wo.foldenable = true
-- vim.o.statuscolumn = '%=%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " }%s%l%{" "}'
-- vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " }%*'

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

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
require("ufo").setup({fold_virt_text_handler = handler})

-- local bufnr = vim.api.nvim_get_current_buf()
-- require("ufo").setVirtTextHandler(bufnr, handler)
