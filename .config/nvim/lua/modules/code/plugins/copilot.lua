local host = os.getenv("MY_HOST")
-- vim.cmd("let g:copilot_proxy ='http://" .. host .. ":4780'")
vim.cmd([[
imap <silent><script><expr> <c-I> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
let g:copilot_idle_delay = 75
let g:copilot_filetypes = {
  \   'markdown': v:true,
  \ }
]])
