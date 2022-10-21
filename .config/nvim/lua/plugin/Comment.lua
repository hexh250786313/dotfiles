local ft = require("Comment.ft")

require("Comment").setup(
  {
    toggler = {
      line = "<space>cl",
      block = "<space>cs"
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
function! s:YankAndComment(type)
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'V'
    normal! `<V`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  lua require('Comment.api').comment.linewise(vim.fn.visualmode())
endfunction
vmap <silent> <space>cy :<c-u>call <SID>YankAndComment(visualmode())<cr>
nmap <silent> <space>cy yy<space>cl
 ]]
)
