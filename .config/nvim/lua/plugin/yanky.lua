require("yanky").setup({})
vim.keymap.set({"n", "x"}, "y", '"+<Plug>(YankyYank)')
vim.keymap.set({"n", "x"}, "p", '"+<Plug>(YankyPutAfter)')
vim.keymap.set({"n", "x"}, "P", '"+<Plug>(YankyPutBefore)')