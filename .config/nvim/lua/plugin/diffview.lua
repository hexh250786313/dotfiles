require "diffview".setup {
  file_history_panel = {
    win_config = {
      height = 9
    }
  }
}

vim.cmd(
  [[
function DisabaleFocusAndDiffviewFileHistory ()
  :FocusDisable
  :DiffviewFileHistory %
endfunction

function DisabaleFocusAndDiffviewHistory ()
  :FocusDisable
  :DiffviewFileHistory
endfunction

function DisabaleFocusAndDiffviewOpen ()
  :FocusDisable
  :DiffviewOpen
endfunction

nnoremap <silent> <Space>gt :call DisabaleFocusAndDiffviewFileHistory()<CR>
nnoremap <silent> <Space>gT :call DisabaleFocusAndDiffviewHistory()<CR>
nnoremap <silent> <Space>gG :call DisabaleFocusAndDiffviewOpen()<CR>
]]
)
