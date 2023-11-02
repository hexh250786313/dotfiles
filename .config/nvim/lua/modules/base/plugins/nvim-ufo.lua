local wk = require("which-key")

vim.o.foldcolumn = "1"
vim.o.foldlevel = 9999
-- vim.o.foldlevelstart = -1
vim.o.foldlevelstart = 9999
vim.wo.foldenable = true
-- vim.o.statuscolumn = '%=%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " }%s%l%{" "}'
-- vim.o.statuscolumn = '%=%l%s%#FoldColumn#%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "" : "") : " " }%*'

wk.register({
  ["zR"] = { '<cmd>lua require("ufo").openAllFolds()<cr>lh', "Open all folds" },
  ["zM"] = { '<cmd>lua require("ufo").closeAllFolds()<cr>lh', "Cloase all folds" },
  ["zr"] = { '<cmd>lua require("ufo").openFoldsExceptKinds()<cr>lh', "Fold less" },
  ["zm"] = { '<cmd>lua require("ufo").closeFoldsWith()<cr>lh', "Fold more" },
  ["za"] = { "zalh", "Toggle fold under cursor" },
  ["zA"] = { "zAlh", "Toggle all folds under cursor" },
})

local handler = function(virtText, lnum, endLnum, width)
  local newVirtText = {}
  -- local endText = ("  %d "):format(endLnum - lnum)
  local endText = (" {} %d 行"):format(endLnum - lnum)
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
      table.insert(newVirtText, { chunkText, hlGroup })
      break
    end
    pos = nextPos
  end
  table.insert(newVirtText, { endText, "Folded" })
  return newVirtText
end

-- global handler
require("ufo").setup({
  fold_virt_text_handler = handler,
  preview = {
    win_config = { winblend = 0 },
    mappings = { scrollU = '<up>', scrollD = '<down>', jumpTop = '[', jumpBot = ']' },
  },
})

-- local bufnr = vim.api.nvim_get_current_buf()
-- require("ufo").setVirtTextHandler(bufnr, handler)
