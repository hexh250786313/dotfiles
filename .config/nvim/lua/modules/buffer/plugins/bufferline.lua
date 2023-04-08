---------> 快捷键
local wk = require("which-key")
wk.register({
  ["g"] = {
    ["1"] = {"<cmd>BufferLineGoToBuffer 1<cr>", "Go to buffer 1"},
    ["2"] = {"<cmd>BufferLineGoToBuffer 2<cr>", "Go to buffer 2"},
    ["3"] = {"<cmd>BufferLineGoToBuffer 3<cr>", "Go to buffer 3"},
    ["4"] = {"<cmd>BufferLineGoToBuffer 4<cr>", "Go to buffer 4"},
    ["5"] = {"<cmd>BufferLineGoToBuffer 5<cr>", "Go to buffer 5"},
    ["6"] = {"<cmd>BufferLineGoToBuffer 6<cr>", "Go to buffer 6"},
    ["7"] = {"<cmd>BufferLineGoToBuffer 7<cr>", "Go to buffer 7"},
    ["8"] = {"<cmd>BufferLineGoToBuffer 8<cr>", "Go to buffer 8"},
    ["9"] = {"<cmd>BufferLineGoToBuffer 9<cr>", "Go to buffer 9"},
    ["b"] = {"<cmd>BufferLineCycleNext<cr>", "Go to right buffer"},
    ["B"] = {"<cmd>BufferLineCyclePrev<cr>", "Go to left buffer"}
  },
  ["<leader>bs"] = {"<cmd>BufferLineSortByDirectory<cr>", "Sort by directory"},
  ["<leader>bc"] = {"<cmd>BufferLinePickClose<cr>", "Close picked buffer"},
  ["<leader>bb"] = {"<cmd>BufferLinePick<cr>", "Go to picked buffer"}
})

---------> 配置
require("bufferline").setup {
  options = {
    numbers = "ordinal",
    separator_style = {"", ""},
    indicator = {icon = "▌"},
    max_prefix_length = 100,
    max_name_length = 100,
    modified_icon = "",
    custom_filter = function(buf_number, buf_numbers)
      local filetype = vim.bo[buf_number].filetype
      if filetype == "defx" then return false end
      return true
    end
  }
}
