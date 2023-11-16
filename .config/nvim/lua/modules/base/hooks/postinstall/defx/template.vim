scriptencoding utf-8
if exists('g:loaded_defx_icons')
  finish
endif
let g:loaded_defx_icons = 1

let s:enable_syntax_highlight = get(g:, 'defx_icons_enable_syntax_highlight', 1)
let s:column_length = get(g:, 'defx_icons_column_length', 1)
let s:parent_icon = get(g:, 'defx_icons_parent_icon', '')
let s:directory_icon = get(g:, 'defx_icons_directory_icon', '')
let s:mark_icon = get(g: , 'defx_icons_mark_icon', '*')
let s:default_icon = get(g:, 'defx_icons_default_icon', '')
let s:directory_symlink_icon = get(g:, 'defx_icons_directory_symlink_icon', '')
let s:root_opened_tree_icon = get(g:, 'defx_icons_root_opened_tree_icon', '')
let s:nested_closed_tree_icon = get(g: ,'defx_icons_nested_closed_tree_icon', '')
let s:nested_opened_tree_icon = get(g: ,'defx_icons_nested_opened_tree_icon', '')
let s:copy_icon = get(g:, 'defx_icons_copy_icon', '')
let s:link_icon = get(g:, 'defx_icons_link_icon', '')
let s:move_icon = get(g:, 'defx_icons_move_icon', '')

let s:extensions = extend({
__REPLACE_2__
      \ }, get(g:, 'defx_icons_extensions', {}))

let s:exact_matches = extend({
__REPLACE_1__
      \ }, get(g:, 'defx_icons_exact_matches', {}))

let s:pattern_matches = extend({ }, get(g:, 'defx_icon_pattern_matches', {}))

let s:exact_dir_matches = extend({ }, get(g:, 'defx_icon_exact_dir_matches', {}))

hi default link DefxIconsMarkIcon Statement
hi default link DefxIconsCopyIcon WarningMsg
hi default link DefxIconsLinkIcon WarningMsg
hi default link DefxIconsMoveIcon ErrorMsg
hi default link DefxIconsDirectory Directory
hi default link DefxIconsParentDirectory Directory
hi default link DefxIconsSymlinkDirectory Directory
hi default link DefxIconsOpenedTreeIcon Directory
hi default link DefxIconsNestedTreeIcon Directory
hi default link DefxIconsClosedTreeIcon Directory

function! defx_icons#get() abort
  return {
        \ 'icons': {
        \   'extensions': s:extensions,
        \   'exact_matches': s:exact_matches,
        \   'pattern_matches': s:pattern_matches,
        \   'exact_dir_matches': s:exact_dir_matches,
        \   'parent_icon': s:parent_icon,
        \   'directory_icon': s:directory_icon,
        \   'directory_symlink_icon': s:directory_symlink_icon,
        \   'mark_icon': s:mark_icon,
        \   'default_icon': s:default_icon,
        \   'root_opened_tree_icon': s:root_opened_tree_icon,
        \   'nested_closed_tree_icon': s:nested_closed_tree_icon,
        \   'nested_opened_tree_icon': s:nested_opened_tree_icon,
        \   'copy_icon': s:copy_icon,
        \   'link_icon': s:link_icon,
        \   'move_icon': s:move_icon,
        \ },
        \ 'settings': {
        \   'enable_syntax_highlight': s:enable_syntax_highlight,
        \   'column_length': s:column_length,
        \ }
        \ }
endfunction
