require("winshift").setup(
  {
    window_picker_ignore = {
      filetype = {
        -- List of ignored file types
        "NvimTree",
        "defx"
      },
      buftype = {
        -- List of ignored buftypes
        "terminal",
        "quickfix"
      },
      bufname = {
        -- List of regex patterns matching ignored buffer names
        [[.*foo/bar/baz\.qux]]
      }
    }
  }
)

vim.cmd([[
function DisabaleFocusAndWinShift ()
  :FocusDisable
  :WinShift swap
  :wincmd p
  :FocusEnable
endfunction
nnoremap <space>ws :call DisabaleFocusAndWinShift()<CR>
]])
