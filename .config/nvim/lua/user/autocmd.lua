vim.cmd([[
]])

vim.api.nvim_create_autocmd({"WinClosed"}, {command = "exec 'wincmd p'"})
