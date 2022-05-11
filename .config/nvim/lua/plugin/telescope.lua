local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[copen]]
        end
      },
      n = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[copen]]
        end
      }
    },
    vimgrep_arguments = {"rg", "--column", "--ignore-case", "--hidden", "--multiline", "--vimgrep"},
    preview = {
      timeout = false
    },
    cache_picker = {
      num_pickers = 20,
      limit_entries = 100
    },
    dynamic_preview_title = true,
    path_display = {"truncate"}
  },
  pickers = {
    find_files = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      }
    },
    live_grep = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      }
    },
    resume = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    },
    pickers = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    },
    oldfiles = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    }
  }
}

vim.cmd(
  [[
function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute printf('Telescope live_grep initial_mode=normal default_text=%s', word)
endfunction

function! s:FindFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute printf('Telescope find_files find_command=rg,--hidden,--files initial_mode=normal default_text=%s', word)
endfunction

nnoremap <silent> <Space>sf <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <silent> <Space>sg <cmd>Telescope live_grep<cr>
nnoremap <silent> <Space>sr <cmd>Telescope pickers<cr><esc>
nnoremap <silent> <Space>] <cmd>Telescope coc definitions layout_strategy=cursor layout_config={height=0.5,width=0.9} initial_mode=normal<CR>
nnoremap <silent> <Space>[ <cmd>Telescope coc references layout_strategy=cursor layout_config={height=0.5,width=0.9} initial_mode=normal<CR>
vnoremap <silent> <Space>sg :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
vnoremap <silent> <Space>sf :<C-u>call <SID>FindFromSelected(visualmode())<CR>

]]
)
