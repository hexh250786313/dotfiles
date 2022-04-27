vim.cmd([[
]])

vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = "wincmd H"})
vim.api.nvim_create_autocmd({"FileType, BufferEnter"}, {pattern = "qf", command = ":vertical resize 40"})
