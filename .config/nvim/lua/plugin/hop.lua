require("hop").setup({create_hl_autocmd = true})

vim.cmd([[
" nmap f <cmd>:HopChar1<CR>
" vmap f <cmd>:HopChar1<CR>
nmap f <cmd>:HopChar2CurrentLine<CR>
vmap f <cmd>:HopChar1CurrentLine<CR>
]])

