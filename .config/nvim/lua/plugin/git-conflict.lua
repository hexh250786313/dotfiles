require("git-conflict").setup({})

vim.keymap.set("n", "<space>sc", ":GitConflictListQf<cr>", {silent = true})

-- vim.api.nvim_create_autocmd("User", {pattern = "GitConflictDetected", command = "hi! CursorLine guibg=NONE"})

-- vim.api.nvim_create_autocmd(
-- "User",
-- {
-- pattern = "GitConflictResolved",
-- command = "exec 'hi! CursorLine' . ' guibg=' . g:defaultnormalgb . ' gui=' . g:defaultcursorlinegui"
-- }
-- )
