---------> 快捷键
local wk = require("which-key")
wk.register({
  ["g"] = {
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Go to buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Go to buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Go to buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Go to buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Go to buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Go to buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Go to buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Go to buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Go to buffer 9" },
    ["b"] = { "<cmd>BufferLineCycleNext<cr>", "Go to right buffer" },
    ["B"] = { "<cmd>BufferLineCyclePrev<cr>", "Go to left buffer" },
  },
  ["<leader>bs"] = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
  ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", "Close picked buffer" },
  ["<leader>bb"] = { "<cmd>BufferLinePick<cr>", "Go to picked buffer" },
})

-- 定义一个全局 Lua 函数
function sortBufferLineTabs(buffer_a, buffer_b)
  -- 读取本地文件中的最近访问文件列表
  local recent_files = {}
  local file = io.open("/home/hexh/.config/coc/mru", "r")
  if file then
    for line in file:lines() do
      table.insert(recent_files, line)
    end
    file:close()
  end

  -- 获取 buffer_a 和 buffer_b 的文件名
  local filename_a = vim.api.nvim_buf_get_name(buffer_a.id)
  local filename_b = vim.api.nvim_buf_get_name(buffer_b.id)

  -- vim.api.nvim_out_write("filename_a: " .. filename_a .. "\n")
  -- vim.api.nvim_out_write("filename_b: " .. filename_b .. "\n")

  -- 检查它们是否在最近访问文件列表中
  local index_a = vim.fn.index(recent_files, filename_a)
  local index_b = vim.fn.index(recent_files, filename_b)

  -- vim.api.nvim_out_write("filename_a: " .. tostring(index_a) .. "\n")
  -- vim.api.nvim_out_write("filename_b: " .. tostring(index_b) .. "\n")

  if index_a == -1 or index_b == -1 then
    return buffer_a.id < buffer_b.id
  end

  return index_a < index_b
  -- nnoremap <silent><mymap> :lua require'bufferline'.sort_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>
end

vim.g.sort_buffer_line_tabs = sortBufferLineTabs

---------> 配置
require("bufferline").setup({
  options = {
    separator_style = { "", "" },
    indicator = { icon = "▌" },
    max_prefix_length = 100,
    max_name_length = 100,
    modified_icon = "",
    custom_filter = function(buf_number, buf_numbers)
      local filetype = vim.bo[buf_number].filetype
      if filetype == "defx" then
        return false
      end
      return true
    end,
    -- sort_by = function(buffer_a, buffer_b) end,
    numbers = "none",
  },
})

function DelayedCommand(cmd)
  vim.defer_fn(function()
    vim.cmd(cmd)
  end, 500) -- 500ms 延迟
end

vim.cmd([[
autocmd BufEnter * lua DelayedCommand(":lua require'bufferline'.sort_by(vim.g.sort_buffer_line_tabs)")
]])
