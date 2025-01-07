require("modules.fzf.plugins.lsp")

---- 快捷键
local wk = require("which-key")
wk.register({
  mode = { "n" },
  ["<leader>/"] = {
    "<cmd>lua require('fzf-lua').live_grep_native({ cmd = 'rg --column --max-columns=300 --ignore-case --hidden --multiline --sort-files --vimgrep --line-number', no_esc = true, resume = true, actions = { ['ctrl-q'] = { fn = require('fzf-lua.actions').file_edit_or_qf } } })<cr>",
    "Grep globally",
  },
  ["<leader>F"] = {
    "<cmd>lua require('fzf-lua').files({ cmd = 'fd --type f --hidden', winopts = { preview = { hidden = 'hidden' } } })<cr>",
    "Grep globally",
  },
  ["?"] = {
    "<cmd>lua require('fzf-lua').grep_curbuf({ resume = true, actions = { ['ctrl-q'] = { fn = require('fzf-lua.actions').file_edit_or_qf } } })<cr>",
    "Grep in current buffer",
  },
})
wk.register({
  mode = { "x" },
  ["<leader>/"] = {
    ":<c-u>exec 'call ' . g:fzf_lua_config_sid . 'GREP_FROM_SELECTED(visualmode())'<cr>",
    "Grep globally",
  },
})

vim.cmd([[
" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:fzf_lua_config_sid = s:SID_PREFIX()

" 从选中的文本中搜索
function! s:GREP_FROM_SELECTED(type)
  " 暂存寄存器的内容
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif

  " 转义 rg 的保留符号
  let wordA  = substitute(@@, '\', '\\\', 'g')
  let wordB  = substitute(wordA, '\.', '\\.', 'g')
  let wordC  = substitute(wordB, '\$', '\\$', 'g')
  let word1  = substitute(wordC, '\n$', '', 'g')
  let word2  = escape(word1, '| ')
  let word3  = substitute(word2, '(', '\\(', 'g')
  let word4  = substitute(word3, ')', '\\)', 'g')
  let word5  = substitute(word4, '}', '\\}', 'g')
  let word6  = substitute(word5, '{', '\\{', 'g')
  let word7  = substitute(word6, ']', '\\]', 'g')
  let word8  = substitute(word7, '[', '\\[', 'g')
  let word9  = substitute(word8, '-', '\\-', 'g')
  let word10 = substitute(word9, '*', '\\*', 'g')
  let word11 = substitute(word10, '+', '\\+', 'g')
  let word12 = substitute(word11, '?', '\\?', 'g')
  let word13 = substitute(word12, '\^', '\\^', 'g')
  let word   = word13

  " 恢复寄存器的内容
  let @@ = saved_unnamed_register
  " no_esc 是不转义的意思，就是不使用 fzf-lua 的转义
lua <<EOF
  require('fzf-lua').live_grep_native({
    cmd = "rg --column --max-columns=300 --ignore-case --hidden --multiline --sort-files --vimgrep --line-number",
    search = vim.fn.eval("word"),
    no_esc = true,
    resume = true,
    actions = {
      ["ctrl-q"] = { fn = require("fzf-lua.actions").file_edit_or_qf }
    }
  })
EOF
endfunction
]])

require("fzf-lua").setup({
  -- 'fzf-native', -- 使用 fzf 本身的预览框预览，但是展示的是实际写入的文件，而不是 neovim 的 buffer，所以不推荐开
  keymap = {
    builtin = { ["<down>"] = "preview-page-down", ["<up>"] = "preview-page-up", ["<c-p>"] = "toggle-preview" },
    fzf = {
      ["CTRL-A"] = "toggle-all",
      ["CTRL-Q"] = "select-all+accept",
      ["CTRL-P"] = "toggle-preview",
    },
  },
  fzf_opts = { ["--cycle"] = "" },
  winopts = {
    border = "rounded",
    preview = {
      vertical = "down:66%",
      layout = "vertical", -- horizontal | vertical | flex
    },
    backdrop = false, -- 背景是否改变颜色
  },
  previewers = {
    builtin = {
      treesitter = { enable = false },
      syntax_limit_l = 0, -- syntax limit (lines), 0=nolimit
      -- 约 500K
      syntax_limit_b = 500 * 1024, -- syntax limit (bytes), 0=nolimit
    },
  },
})
