local ft = require("Comment.ft")

---------> 快捷键
local wk = require("which-key")
wk.register(
  {
    mode = {"n", "x"},
    ["<leader>cy"] = {"yy<space>cl", "Comment line current and yank"},
    ["<leader>cl"] = {"<cmd>exec 'call ' . g:comment_config_sid . 'YANK_AND_COMMENT(visualmode())'<cr>", "Comment current line"},
  }
)

---------> 配置
require("Comment").setup(
  {
    toggler = {
      line = "<leader>cl",
      block = "<leader>cs"
    },
    opleader = {
      line = "<space>cl",
      block = "<space>cs"
    }
  }
)
ft({"javascript", "javascriptreact", "typescript", "typescriptreact"}, {"//%s", "/**%s*/"})
ft({"json"}, {"//%s"})

vim.cmd(
  [[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:comment_config_sid = s:SID_PREFIX()

function! s:YANK_AND_COMMENT(type) abort
  if a:type ==# 'v'
    normal! `<v`>"+y
  elseif a:type ==# 'V'
    normal! `<V`>"+y
  elseif a:type ==# 'char'
    normal! `[v`]"+y
  else
    return
  endif
  lua require('Comment.api').comment.linewise(vim.fn.visualmode())
endfunction
 ]]
)
