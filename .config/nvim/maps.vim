" 复制/粘贴到系统剪贴板
" noremap <C-c> "+y
" noremap <Space>y :OSCYank<CR>
" noremap <C-v> "+p
" noremap <C-x> "+d

" noremap p "0p
" noremap x "0x
" noremap s "0s
" noremap dd "0dd

" noremap y "+y
" noremap yy "+yy
" noremap p "+p
" noremap x "+x
" noremap s "+s
" noremap dd "+dd
" noremap d "+d
" noremap c "+c
" noremap C "+C
set clipboard=unnamedplus

" nmap <silent> <Space>bf :Prettier<CR>
xmap <silent> <Space>bf  <Plug>(coc-format-selected)
nmap <silent> <Space>bf  <Plug>(coc-format)
nnoremap <silent> <Space>bd :bd<CR>

nnoremap <silent> <Space>gs :CocCommand git.chunkStage<CR>
nnoremap <silent> <Space>gu :CocCommand git.chunkUndo<CR>
nnoremap <silent> <Space>gI :CocCommand git.chunkInfo<CR>
nnoremap <silent> <Space>gi :VGit buffer_hunk_preview<CR>
nnoremap <silent> <Space>gt :GitTimeLapse<CR>
nnoremap <silent> <Space>gT :VGit buffer_history_preview<CR>
nnoremap <silent> <Space>gd :CocCommand git.diffCached<CR>
nnoremap <silent> <Space>gl :CocCommand git.showCommit<CR>
nnoremap <silent> <Space>gg :Git<CR>
nmap <Space>g[ <Plug>(coc-git-prevchunk)
nmap <Space>g] <Plug>(coc-git-nextchunk)

nnoremap <silent> <Space>zs :CocCommand session.save<CR>
nnoremap <silent> <Space>zl :CocCommand session.load<CR>

nmap <silent> <Space>fo :Defx -search-recursive=`expand('%:p')` -wincol=`&columns/9` -winwidth=`&columns/3` -preview-width=`&columns/2` -winrow=`&lines/9` -winheight=`&lines/2` -preview_height=`&lines/1`<CR>

" xmap <silent> v :lua require'nvim-treesitter.incremental_selection'.node_incremental()<CR>
" xmap <silent> V :lua require'nvim-treesitter.incremental_selection'.node_decremental()<CR>
xmap v <Plug>(expand_region_expand)
xmap V <Plug>(expand_region_shrink)

nnoremap <silent> <C-s> :silent write<CR>
nnoremap <silent> <Space>wq :q<CR>
nnoremap <silent> <Space>wV :vsplit<CR>
nnoremap <silent> <Space>wS :split<CR>
nnoremap <silent> <Space>wj <C-w>j
nnoremap <silent> <Space>wh <C-w>h
nnoremap <silent> <Space>wk <C-w>k
nnoremap <silent> <Space>wl <C-w>l
nnoremap <silent> <Space>wJ <C-w>J
nnoremap <silent> <Space>wH <C-w>H
nnoremap <silent> <Space>wK <C-w>K
nnoremap <silent> <Space>wL <C-w>L
nnoremap <silent> <Space>wd :q<CR>
nnoremap <silent> <Space>ww <C-w>w
nnoremap <silent> <Space>wW <C-w>W

nnoremap <silent> <Space>qq :qa<CR>
nnoremap <silent> <Space>qt :tabclose<CR>

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1

nmap <silent> <Space>cl <Plug>NERDCommenterToggle
nmap <silent> <Space>cy <Plug>NERDCommenterYank
" nmap <silent> <Space>cy yy<Space>cl
nmap <silent> <Space>cs <Plug>NERDCommenterSexy
nmap <silent> <Space>cu <Plug>NERDCommenterUncomment

vmap <silent> <Space>cl <Plug>NERDCommenterToggle
vmap <silent> <Space>cy <Plug>NERDCommenterYank
" vmap <silent> <Space>cy ygv<Space>cl
vmap <silent> <Space>cs <Plug>NERDCommenterSexy
vmap <silent> <Space>cu <Plug>NERDCommenterUncomment

nnoremap <Space><tab> <C-^>

" nmap f <Plug>(easymotion-sl)
" vmap f <Plug>(easymotion-sl)

" map <Space> <Plug>(easymotion-prefix)

nmap f <cmd>:HopChar1<CR>
vmap f <cmd>:HopChar1<CR>
" nmap f <cmd>:HopChar1CurrentLine<CR>
" vmap f <cmd>:HopChar1CurrentLine<CR>

xnoremap > >gv|
xnoremap < <gv
nnoremap > >>_
nnoremap < <<_

nnoremap <silent> <C-r> :silent redo<CR>
nnoremap <silent> u :silent undo<CR>

nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <silent> <Space>} :call CocAction('jumpDefinition', v:false)<CR>
nnoremap <silent> <Space>{ :call CocAction('jumpReferences', v:false)<CR>
" nnoremap <silent> <script> <Space>sq :CocList --auto-preview --normal --tab --number-select quickfix<CR>
" nnoremap <silent> <Space>sf :CocList files<CR>
" nnoremap <silent> <Space>sg :CocList grep<CR>
" nnoremap <silent> <Space>sb :CocList --no-sort --normal mru<CR>
" nnoremap <silent> <Space>sy :CocList --auto-preview --normal --tab yank<CR>
nnoremap <silent> <Space>sy :Yanks<CR>

" vnoremap <silent> <Space>sg :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
vnoremap <silent> <Space>sg :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
vnoremap <silent> <Space>sf :<C-u>call <SID>FindFromSelected(visualmode())<CR>

nnoremap <silent> <Space>] <cmd>Telescope coc definitions layout_strategy=cursor layout_config={height=0.3,width=0.9}<cr><esc>
nnoremap <silent> <Space>[ <cmd>Telescope coc references layout_strategy=cursor layout_config={height=0.3,width=0.9}<cr><esc>
" nnoremap <silent> <Space>sq <cmd>Telescope quickfix<cr><esc>
nnoremap <silent> <Space>sq <cmd>botright copen<cr><esc>
nnoremap <silent> <Space>sf <cmd>Telescope find_files find_command=rg,--hidden,--files<cr>
nnoremap <silent> <Space>sg <cmd>Telescope live_grep<cr>
nnoremap <silent> <Space>sb <cmd>Telescope coc mru layout_strategy=vertical layout_config={width=0.9,height=0.95,preview_cutoff=36}<cr><esc>
nnoremap <silent> <Space>sr <cmd>Telescope resume layout_strategy=vertical layout_config={width=0.9,height=0.95,preview_cutoff=36}<cr>

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
  " execute 'CocList grep '.word
  execute 'Telescope live_grep default_text='.word
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
  " execute 'CocList grep '.word
  execute 'Telescope find_files find_command=rg,--hidden,--files default_text='.word
endfunction

" nnoremap <silent> <Space>w= :FocusToggle<CR>
nnoremap <silent> <Space>' <cmd>ToggleTerm direction=float<cr>

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  " nmap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Plug>(SmoothieForwards)"
  " nmap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Plug>(SmoothieBackwards)"
  " vmap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Plug>(SmoothieForwards)"
  " vmap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Plug>(SmoothieBackwards)"
endif

nnoremap ma mA
nnoremap 'a 'A
nnoremap `a 'A
nnoremap ms mS
nnoremap 's 'S
nnoremap `s 'S
nnoremap md mD
nnoremap 'd 'D
nnoremap `d 'D
nnoremap mf mF
nnoremap 'f 'F
nnoremap `f 'F
nnoremap mb mB
nnoremap 'b 'B
nnoremap `b 'B
nnoremap mc mC
nnoremap 'c 'C
nnoremap `c 'C

" nmap <Down> <C-e>
" nmap <Up> <C-y>
" nmap <S-Up> <C-u>
" nmap <S-Down> <C-d>
" nmap <S-Up> <Plug>(SmoothieUpwards)
" nmap <S-Down> <Plug>(SmoothieDownwards)

nmap <Space>wt <C-w>v<C-w>T

nmap <Space>1 1gt
nmap <Space>2 2gt
nmap <Space>3 3gt
nmap <Space>4 4gt
nmap <Space>5 5gt
nmap <Space>6 6gt
nmap <Space>7 7gt
nmap <Space>8 8gt
nmap <Space>9 9gt
nmap <Space>0 10gt

nmap <expr> p yoink#canSwap() ? '<plug>(YoinkPostPasteSwapBack)' : '<plug>(YoinkPaste_p)'
nmap <expr> P yoink#canSwap() ? '<plug>(YoinkPostPasteSwapForward)' : '<plug>(YoinkPaste_P)'
nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)
