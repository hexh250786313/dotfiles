local wk = require("which-key")

wk.setup(
  {
    key_labels = {["<leader>"] = "SPC"}
  }
)

-- lsp
wk.register(
  {
    mode = {"n"},
    ["gr"] = {"<cmd>call CocActionAsync('jumpReferences', v:false)<cr>", "Go to references"},
    ["gd"] = {"<cmd>call CocActionAsync('jumpDefinition', v:false)<cr>", "Go to definition"}
    -- ["gd"] = {name = "Go to definition"}
  }
)
