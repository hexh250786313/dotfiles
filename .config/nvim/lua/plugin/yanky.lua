require("yanky").setup({})
vim.keymap.set({"n", "x"}, "y", '"0<Plug>(YankyYank)')
vim.keymap.set({"n", "x"}, "p", '"0<Plug>(YankyPutAfter)')
vim.keymap.set({"n", "x"}, "P", '"0<Plug>(YankyPutBefore)')
