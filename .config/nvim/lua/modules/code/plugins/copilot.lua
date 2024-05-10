local host = os.getenv("MY_HOST")
-- vim.cmd("let g:copilot_proxy ='http://" .. host .. ":4780'")
vim.cmd([[
" ---- 不需要 tab 的话就打开下面三行的注释
" imap <silent><script><expr> <c-o> copilot#Accept("\<Tab>")
" let g:copilot_no_maps = v:true
" let g:copilot_no_tab_map = v:true
" -------------------
let g:copilot_idle_delay = 50
" let g:copilot_auth_provider_url = 'https://cocopilot.org'
let g:copilot_filetypes = {
  \   'markdown': v:true,
  \ }
]])
