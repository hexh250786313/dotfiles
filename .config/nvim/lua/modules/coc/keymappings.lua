local wk = require("which-key")

-- lsp
wk.register(
  {
    mode = {"n"},
    ["gr"] = {"<cmd>call CocActionAsync('jumpReferences')<cr>", "Go to references"},
    ["gd"] = {"<cmd>call CocActionAsync('jumpDefinition')<cr>", "Go to definition"},
    ["gh"] = {":<c-u>call function(g:coc_config_sid . 'SHOW_DOCUMENTATION')()<cr>", "Show docs for item under cursor"}
  }
)

-- files
wk.register(
  {
    mode = {"n"},
    ["<leader>f"] = {"<cmd>CocList --height=9 filesMru<cr>", "Open file picker"}
  }
)

-- git
wk.register(
  {
    mode = {"n"},
    ["<leader>gs"] = {"<cmd>CocCommand git.chunkStage<cr>", "Stage git chunk"},
    ["<leader>gu"] = {"<cmd>CocCommand git.chunkUndo<cr>", "Undo git chunk"},
    ["<leader>gi"] = {"<cmd>CocCommand git.chunkInfo<cr>", "Show git chunk info"},
    ["<leader>gd"] = {"<cmd>CocCommand git.diffCached<cr>", "Show git chunk diff info"},
    ["[g"] = {"<Plug>(coc-git-prevchunk)", "Go to previous change"},
    ["]g"] = {"<Plug>(coc-git-nextchunk)", "Go to next change"}
  }
)

-- list
wk.register(
  {
    ["<leader>l"] = {name = "List"}
  }
)
wk.register(
  {
    mode = {"n"},
    ["<leader>ld"] = {"<cmd>CocList --no-sort diagnostics<cr>", "Diagnostics list"},
    ["<leader>lt"] = {"<cmd>CocList tasks<cr>", "Tasks list"},
    ["<leader>ls"] = {"<cmd>CocList --no-sort services<cr>", "LSP Services list"},
    ["<leader>la"] = {"<plug>(coc-codeaction-line)", "LSP CodeActions list for line"},
    ["<leader>lA"] = {"<plug>(coc-codeaction-cursor)", "LSP CodeActions list for cursor"},
    ["]g"] = {"<Plug>(coc-git-nextchunk)", "Go to next change"}
  }
)
wk.register(
  {
    mode = {"x"},
    ["<leader>la"] = {"<plug>(coc-codeaction-selected)", "LSP CodeActions list"}
  }
)
