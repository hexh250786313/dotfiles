require "diffview".setup {
  file_history_panel = {
    height = 1
  }
}

vim.cmd([[
function DisabaleFocusAndDiffviewFileHistory ()
  :FocusDisable
  :DiffviewFileHistory
endfunction

function DisabaleFocusAndDiffviewOpen ()
  :FocusDisable
  :DiffviewOpen
endfunction

nnoremap <silent> <Space>gt :call DisabaleFocusAndDiffviewFileHistory()<CR>
nnoremap <silent> <Space>gG :call DisabaleFocusAndDiffviewOpen()<CR>
]])
