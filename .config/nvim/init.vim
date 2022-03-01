" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set mouse=a
set nocompatible
set number
syntax enable
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set nowritebackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
" set scrolloff=10
set expandtab
set relativenumber
"let loaded_matchparen = 1
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*
set updatetime=300
set shortmess+=c

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
" set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}


" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
endif
runtime ./maps.vim

"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  " let g:neosolarized_termtrans=1
  " runtime ./colors/NeoSolarized.vim
  " colorscheme NeoSolarized
endif

"}}}

let g:coc_enable_locationlist = 0
autocmd User CocLocationsChange CocList --normal --tab --auto-preview location

let g:coc_user_config = 
      \  {
      \    "session.directory": "~/.vimsessions",
      \   "diagnostic.virtualTextPrefix": " ▸ ",
      \   "diagnostic.errorSign": "\uf65b",
      \   "diagnostic.warningSign": "\uf525",
      \   "diagnostic.infoSign": "\uf7fb",
      \   "diagnostic.hintSign": "\uf7d6",
      \   "snippets.extends": {
      \     "javascriptreact": ["javascript"],
      \     "typescriptreact": ["javascript", "javascript-jasmine-arrow"],
      \     "typescript": ["javascript", "javascript-jasmine-arrow"]
      \   },
      \   "git.changedSign.text": "▌",
      \   "git.addedSign.text": "▌",
      \   "git.removedSign.text": "▁",
      \   "git.changeRemovedSign.text": "▁",
      \   "git.topRemovedSign.text": "▔",
      \   "git.changedDecorator": " ",
      \   "git.stagedDecorator": " ",
      \   "git.untrackedDecorator": " ✩",
      \   "git.conflictedDecorator": "⇡⇣",
      \   "git.virtualTextPrefix": " \ue729 ",
      \   "list.indicator": "❯",
      \   "git.addGBlameToVirtualText": 1,
      \   "list.source.grep.useLiteral": 0,
      \   "suggest.snippetIndicator": " ✩",
      \   "list.source.grep.command": "rg",
      \   "list.source.grep.args": ["-i", "--hidden"],
      \   "list.source.grep.excludePatterns": ["**/.git/**"],
      \   "list.source.files.args": ["--files", "--hidden"],
      \   "list.source.files.excludePatterns": ["**/.git/**"],
      \   "diagnostic.virtualText": 1,
      \   "diagnostic.virtualTextCurrentLineOnly": 0,
      \   "coc.preferences.semanticTokensFiletypes": ["*"],
      \   "suggest.completionItemKindLabels": {
      \     "keyword": "\uf1de",
      \     "variable": "\ue79b",
      \     "value": "\uf89f",
      \     "operator": "\u03a8",
      \     "constructor": "\uf0ad",
      \     "function": "\u0192",
      \     "reference": "\ufa46",
      \     "constant": "\uf8fe",
      \     "method": "\uf09a",
      \     "struct": "\ufb44",
      \     "class": "\uf0e8",
      \     "interface": "\uf417",
      \     "text": "\ue612",
      \     "enum": "\uf435",
      \     "enumMember": "\uf02b",
      \     "module": "\uf40d",
      \     "color": "\ue22b",
      \     "property": "\ue624",
      \     "field": "\uf9be",
      \     "unit": "\uf475",
      \     "event": "\ufacd",
      \     "file": "\uf723",
      \     "folder": "\uf114",
      \     "snippet": "\ue60b",
      \     "typeParameter": "\uf728",
      \     "default": "\uf29c"
      \   },
      \   "suggest.labelMaxLength": 30,
      \   "suggest.numberSelect": 1,
      \   "signature.floatConfig": {
      \     "border": 1
      \   },
      \   "diagnostic.floatConfig": {
      \     "border": 1
      \   },
      \   "hover.floatConfig": {
      \     "border": 1
      \   },
      \   "suggest.floatConfig": {
      \     "border": 1
      \   },
      \   "suggest.timeout": 10000,
      \   "coc.preferences.extensionUpdateCheck": "daily",
      \   "diagnostic.checkCurrentLine": 1,
      \   "diagnostic.separateRelatedInformationAsDiagnostics": 1,
      \   "eslint.packageManager": "yarn",
      \   "git.semanticCommit.scope": 0,
      \   "suggest.detailField": "abbr",
      \   "suggest.defaultSortMethod": "none",
      \   "suggest.enablePreselect": 1,
      \   "coc.source.file.ignoreHidden": 0,
      \   "coc.source.around.firstMatch": 0,
      \   "coc.preferences.colorSupport": 0,
      \   "tsserver.maxTsServerMemory": 16384,
      \   "tsserver.locale": "zh-cn",
      \   "tsserver.ignoreLocalTsserver": 1,
      \   "git.conflict.enabled": 0,
      \ }

      " \   "tsserver.tsdk": "/home/hexh/.nvm/versions/node/v16.5.0/lib/node_modules/typescript/lib"
      " \   "tsserver.log": "verbose",
      " \   "tsserver.trace.server": "verbose",
      " \   "git.changedSign.text": "▌",
      " \   "git.addedSign.text": "▌",
      " \   "typescript.inlayHints.parameterTypes.enabled": 1,
      " \   "javascript.inlayHints.parameterTypes.enabled": 1,
      " \   "typescript.inlayHints.propertyDeclarationTypes.enabled": 1,
      " \   "javascript.inlayHints.propertyDeclarationTypes.enabled": 1,
      " \   "typescript.inlayHints.variableTypes.enabled": 1,
      " \   "javascript.inlayHints.variableTypes.enabled": 1,
      " \   "typescript.inlayHints.functionLikeReturnTypes.enabled": 1,
      " \   "javascript.inlayHints.functionLikeReturnTypes.enabled": 1,
      " \   "typescript.inlayHints.enumMemberValues.enabled": 1,
      " \   "javascript.inlayHints.enumMemberValues.enabled": 1
      " \   "codeLens.enable": 1,
      " \   "codeLens.position": "eol",
      " \   "signature.target": "echo",
      " \   "git.addedSign.text": "░▓",
      " \   "git.changedSign.text": "░▓",
      " \   "git.removedSign.text": "░▓",
      " \   "git.topRemovedSign.text": "░▓",
      " \   "git.changeRemovedSign.text": "░▓",
      " \   "typescript.inlayHints.parameterNames.enabled": "all",
      " \   "typescript.inlayHints.parameterTypes.enabled": 1,
      " \   "typescript.inlayHints.variableTypes.enabled": 1,
      " \   "typescript.inlayHints.enumMemberValues.enabled": 1,
      " \   "typescript.inlayHints.functionLikeReturnTypes.enabled": 1,
      " \   "typescript.inlayHints.propertyDeclarationTypes.enabled": 1,
      " \   "typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName": 1,
      " \   "javascript.inlayHints.parameterNames.enabled": "all",
      " \   "javascript.inlayHints.variableTypes.enabled": 1,
      " \   "javascript.inlayHints.parameterTypes.enabled": 1,
      " \   "javascript.inlayHints.enumMemberValues.enabled": 1,
      " \   "javascript.inlayHints.functionLikeReturnTypes.enabled": 1,
      " \   "javascript.inlayHints.propertyDeclarationTypes.enabled": 1,
      " \   "javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName": 1

let g:coc_global_extensions = 
      \ [
      \   'coc-css',
      \   'coc-eslint',
      \   'coc-git',
      \   'coc-highlight',
      \   'coc-html',
      \   'coc-json',
      \   'coc-lists',
      \   'coc-pairs',
      \   'coc-snippets',
      \   'coc-tsserver',
      \   'coc-yank',
      \   'coc-lua',
      \ ]

" coc 选择了 quickfix 打开后的回调
let g:coc_quickfix_open_command = 'CocList --auto-preview --normal --tab --number-select quickfix'

command! -nargs=? Fold :call CocAction('fold', <f-args>)

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ii'  :1,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

if exists('*complete_info')
  inoremap <silent><expr> <cr> complete_info(['selected'])['selected'] != -1 ? "\<C-y>" : "\<C-g>u\<CR>"
endif

let g:fugitive_pty = 0


" let blacklist = ['vim', 'help']
" autocmd CursorHold * if (index(blacklist, &ft) < 0 || !coc#rpc#ready()) | silent! call CocActionAsync('doHover')
" autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * if (coc#rpc#ready()) | silent call CocActionAsync('highlight')
" autocmd CursorHold * if (coc#rpc#ready()) | silent call timer_start(2000, { tid -> execute("call CocActionAsync('highlight')") })
" au VimEnter * call timer_start(2000, { tid -> execute('VGit toggle_live_blame') })

" autocmd User EasyMotionPromptBegin silent! CocDisable
" autocmd User EasyMotionPromptEnd silent! CocEnable

function! s:CtrlZ()
  " call writefile([getcwd(),''], '/tmp/cd_vim', 'b')
  call writefile([expand("%:p:h")], '/tmp/cd_vim', 'b')
  return "\<C-z>"
endfunction
nnoremap <expr> <C-z> <SID>CtrlZ()

let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'javascriptreact': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'typescript': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
	\ 'typescriptreact': { 'left': '//', 'right': '', 'leftAlt': '/**', 'rightAlt': '*/' },
\}

set shortmess+=c

colorscheme codedark

highlight! Normal ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE
highlight! SignColumn ctermbg=NONE guibg=NONE
highlight! EndOfBuffer ctermbg=NONE guibg=NONE

" highlight CursorLine guibg=#455a64
highlight CursorLine guibg=#23272e
" highlight CursorColumn guibg=#455a64
highlight CocListPath guibg=#455a64
highlight CocListMode guibg=#455a64

highlight CocHighlightText cterm=underline guibg=#0f6073

let g:defx_icons_column_length = 3
let g:defx_mark_column_length = 3
call defx#custom#column('git', 'column_length', 3)

call defx#custom#column('filename', {
      \ 'min_width': 200,
      \ 'max_width': 1000,
      \ })


" Misc
" highlight TSError guifg=#F44747
" highlight TSPunctDelimiter guifg=#ABB2BF
" highlight TSPunctBracket guifg=#ABB2BF
" highlight TSPunctSpecial guifg=#ABB2BF

" Constants
" highlight TSConstant gui=italic guifg=#569CD6
" highlight TSConstBuiltin gui=italic guifg=#569CD6
" Not sure about this guy
" highlight TSConstMacro gui=italic guifg=#569CD6
highlight TSString gui=italic guifg=#CE9178
" highlight TSStringRegex guifg=#CE9178
" highlight TSStringEscape guifg=#D7BA7D
highlight TSCharacter gui=italic guifg=#CE9178
highlight TSNumber gui=italic guifg=#B5CEA8
highlight TSBoolean gui=italic guifg=#569CD6
highlight TSFloat gui=italic guifg=#B5CEA8
" highlight TSAnnotation guifg=#DCDCAA
" highlight TSAttribute guifg=#FF00FF
" highlight TSNamespace guifg=#FF00FF

" Functions
" highlight TSFuncBuiltin guifg=#DCDCAA
" highlight TSFunction guifg=#DCDCAA
" highlight TSFuncMacro guifg=#DCDCAA
" highlight TSMethod guifg=#DCDCAA
highlight TSParameter gui=italic guifg=#9CDCFE
" highlight TSParameterReference guifg=#9CDCFE
" highlight TSField guifg=#9CDCFE
" highlight TSProperty guifg=#9CDCFE
" highlight TSConstructor guifg=#4EC9B0
" Bold
highlight TSFuncBuiltin gui=Bold guifg=#DCDCAA
highlight TSFunction gui=Bold guifg=#DCDCAA
highlight TSFuncMacro gui=Bold guifg=#DCDCAA
highlight TSMethod gui=Bold guifg=#DCDCAA
highlight TSConstructor gui=Bold guifg=#4EC9B0
" Italic
" highlight TSFuncBuiltin gui=italic guifg=#DCDCAA
" highlight TSFunction gui=italic guifg=#DCDCAA
" highlight TSFuncMacro gui=italic guifg=#DCDCAA
" highlight TSMethod gui=italic guifg=#DCDCAA
" highlight TSParameter gui=italic guifg=#9CDCFE
" highlight TSParameterReference gui=italic guifg=#9CDCFE
" highlight TSField gui=italic guifg=#9CDCFE
" highlight TSProperty gui=italic guifg=#9CDCFE

" Keywords
" highlight TSConditional guifg=#C586C0
" highlight TSRepeat guifg=#C586C0
" highlight TSLabel guifg=#FF00FF
" Does not work for yield and return they should be diff then class and def
highlight TSKeyword gui=italic guifg=#569CD6
" highlight TSKeywordFunction guifg=#FF00FF
" highlight TSKeywordOperator guifg=#569CD6
" highlight TSOperator guifg=#ABB2BF
" highlight TSException guifg=#C586C0
" highlight TSType guifg=#4EC9B0
" highlight TSTypeBuiltin guifg=#FF00FF
" highlight TSStructure guifg=#FF00FF
highlight TSInclude gui=italic guifg=#c586c0

" Variable
highlight TSVariable gui=italic guifg=#4ec9b0
highlight TSVariableBuiltin gui=italic guifg=#9CDCFE

" Text
" highlight TSText guifg=#FF00FF
" highlight TSStrong guifg=#FF00FF
" highlight TSEmphasis guifg=#FF00FF
" highlight TSUnderline guifg=#FF00FF
" highlight TSTitle guifg=#FF00FF
" highlight TSLiteral guifg=#FF00FF
" highlight TSURI guifg=#FF00FF

" Tags
highlight TSTag gui=Bold guifg=#569CD6
highlight TSTagAttribute gui=italic guifg=#9CDCFE
" highlight TSTagDelimiter guifg=#FF00FF

" let g:matchup_matchparen_offscreen = {}

" autocmd FileType defx hi! Normal ctermbg=NONE guibg=NONE

:hi DefxIconsNestedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsParentDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsOpenedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsClosedTreeIcon guibg=NONE guifg=#569CD6
:hi DefxIconsDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsSymlinkDirectory guibg=NONE guifg=#569CD6
:hi DefxIconsCopyIcon guibg=NONE guifg=#ce9178
:hi DefxIconsMoveIcon guibg=NONE guifg=#f04747

" autocmd User TelescopePreviewerLoaded setlocal number

set foldlevel=99

" gui
set guifont=CaskaydiaCove\ Nerd\ Font:h12.9
let neovide_remember_window_size = v:true

" 这段放最底下，不然会被覆盖
" disable the default highlight group
let g:conflict_marker_highlight_group = ''
" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'
highlight ConflictMarkerBegin guibg=#2f7366 guifg=#ffffff
highlight ConflictMarkerOurs guibg=#2e5049 guifg=#ffffff
highlight ConflictMarkerTheirs guibg=#344f69 guifg=#ffffff
highlight ConflictMarkerEnd guibg=#2f628e guifg=#ffffff

let g:mkdp_open_to_the_world = 1
