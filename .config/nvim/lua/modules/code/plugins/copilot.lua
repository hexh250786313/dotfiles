local host = os.getenv("MY_HOST")
-- vim.cmd("let g:copilot_proxy ='http://" .. host .. ":4780'")
vim.cmd([[
 " 必须要定一个映射，否则无法取消 tab 映射，很诡异，总之这一行不能删
imap <silent><script><expr> <c-o> copilot#Accept("\<Tab>")
" ---- 不需要 tab 的话就打开下面两行的注释
let g:copilot_no_maps = v:true
let g:copilot_no_tab_map = v:true
" -------------------
let g:copilot_idle_delay = 50
" let g:copilot_auth_provider_url = 'https://cocopilot.org'
let g:copilot_filetypes = {
  \   'markdown': v:true,
  \ }
]])
