local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-n>"] = function()
        end,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<Up>"] = actions.preview_scrolling_up,
        ["<Down>"] = actions.preview_scrolling_down
      },
      n = {
        ["<C-p>"] = action_layout.toggle_preview,
        ["<C-n>"] = function()
        end,
        ["P"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[copen]]
        end,
        ["<Up>"] = actions.preview_scrolling_up,
        ["<Down>"] = actions.preview_scrolling_down
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
    path_display = {"truncate"},
    layout_config = {
      scroll_speed = 3
    }
  },
  pickers = {
    -- layout right
    -- find_files = {
    -- layout_strategy = "vertical",
    -- layout_config = {
    -- width = 0.5,
    -- height = 0.95,
    -- preview_cutoff = 0,
    -- anchor = "E" -- 右边
    -- }
    -- },
    find_files = {
      layout_strategy = "vertical",
      previewer = false,
      sorting_strategy = "ascending", -- 结果从上到下
      layout_config = {
        prompt_position = "top", -- 输入框相对于列表的位置
        width = 0.75,
        height = 0.80,
        preview_cutoff = 0,
        mirror = false,
        -- anchor = "N" -- 置顶居中
        anchor = "" -- 居中
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
" nnoremap <silent> <Space>sg <cmd>Telescope live_grep<cr>
nnoremap <silent> <Space>sr <cmd>Telescope pickers<cr><esc>
nnoremap <silent> <Space>] <cmd>Telescope coc definitions sorting_strategy=ascending layout_strategy=cursor layout_config={height=0.5,width=0.9} initial_mode=normal<CR>
nnoremap <silent> <Space>[ <cmd>Telescope coc references sorting_strategy=ascending layout_strategy=cursor layout_config={height=0.5,width=0.9} initial_mode=normal<CR>
nnoremap <silent> <Space>sb <cmd>Telescope coc mru sorting_strategy=ascending layout_strategy=vertical previewer=false layout_config={prompt_position='top',height=0.8,width=0.75,preview_cutoff=0,mirror=false,anchor=''} initial_mode=normal<CR>
" nnoremap <C-LeftMouse> <cmd>Telescope coc definitions sorting_strategy=ascending layout_strategy=cursor layout_config={height=0.5,width=0.9} initial_mode=normal<CR>
" vnoremap <silent> <Space>sg :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
vnoremap <silent> <Space>sf :<C-u>call <SID>FindFromSelected(visualmode())<CR>

]]
)
