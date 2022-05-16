require("bufferline").setup {
  options = {
    separator_style = {"", ""},
    indicator_icon = "▌",
    max_prefix_length = 100
  },
  highlights = {
    fill = {
      guibg = "#373737"
    },
    group_separator = {
      guibg = "#373737"
    },
    group_label = {
      guibg = "#373737"
    },
    tab = {
      guibg = "#373737"
    },
    tab_selected = {
      guibg = "#0a7aca"
    },
    tab_close = {
      guibg = "#373737"
    },
    close_button = {
      guibg = "#373737"
    },
    close_button_selected = {
      guibg = "#0a7aca",
      guifg = "#ffffff"
    },
    buffer_selected = {
      guibg = "#0a7aca",
      guifg = "#ffffff"
    },
    background = {
      guibg = "#373737"
    },
    buffer = {
      guibg = "#373737"
    },
    diagnostic = {
      guibg = "#373737"
    },
    diagnostic_selected = {
      guibg = "#0a7aca"
    },
    hint = {
      guibg = "#373737"
    },
    hint_selected = {
      guibg = "#0a7aca"
    },
    hint_diagnostic = {
      guibg = "#373737"
    },
    hint_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    info = {
      guibg = "#373737"
    },
    info_selected = {
      guibg = "#0a7aca"
    },
    info_diagnostic = {
      guibg = "#373737"
    },
    info_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    warning_selected = {
      guibg = "#0a7aca"
    },
    warning = {
      guibg = "#373737"
    },
    warning_diagnostic = {
      guibg = "#373737"
    },
    warning_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    error = {
      guibg = "#373737"
    },
    error_diagnostic = {
      guibg = "#373737"
    },
    error_selected = {
      guibg = "#0a7aca"
    },
    error_diagnostic_selected = {
      guibg = "#0a7aca"
    },
    modified = {
      guibg = "#373737"
    },
    modified_selected = {
      guibg = "#0a7aca"
    },
    duplicate = {
      gui = "italic",
      guibg = "#373737"
    },
    duplicate_selected = {
      guibg = "#0a7aca",
      guifg = "#ffaf00"
    },
    separator_selected = {
      guifg = "#373737",
      guibg = "#0a7aca"
    },
    separator_visible = {
      guifg = "#373737"
    },
    separator = {
      guifg = "#373737",
      guibg = "#373737"
    },
    indicator_selected = {
      guibg = "#0a7aca",
      guifg = "#ffffff"
    },
    pick = {
      guibg = "#373737",
      gui = "bold,italic"
    },
    pick_selected = {
      guibg = "#0a7aca"
    }
  }
}

vim.cmd(
  [[
function DeleteAllBuffers ()
  " :BufferLineCloseLeft
  " :BufferLineCloseRight
  :%bd
  :e#
  :bd#
endfunction

nnoremap <silent> <Space>bD :call DeleteAllBuffers()<CR>
nnoremap <silent> <Space>1 :BufferLineGoToBuffer 1<cr>
nnoremap <silent> <Space>2 :BufferLineGoToBuffer 2<cr>
nnoremap <silent> <Space>3 :BufferLineGoToBuffer 3<cr>
nnoremap <silent> <Space>4 :BufferLineGoToBuffer 4<cr>
nnoremap <silent> <Space>5 :BufferLineGoToBuffer 5<cr>
nnoremap <silent> <Space>6 :BufferLineGoToBuffer 6<cr>
nnoremap <silent> gb :BufferLineCycleNext<cr>
nnoremap <silent> gB :BufferLineCyclePrev<cr>
nnoremap <silent> <space>bs :BufferLineSortByDirectory<cr>
nnoremap <silent> <space>bp :BufferLinePick<cr>
nnoremap <silent> <space>bp :BufferLinePick<cr>
nnoremap <silent> <space>b> :BufferLineMoveNext<cr>
nnoremap <silent> <space>b< :BufferLineMovePrev<cr>
]]
)
