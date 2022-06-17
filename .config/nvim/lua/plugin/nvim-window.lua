require("nvim-window").setup(
  {
    normal_hl = "Visual",
    hint_hl = "Bold",
    border = "none"
  }
)

vim.api.nvim_set_keymap("n", "<space>ww", ":lua require('nvim-window').pick()<cr>", {silent = true})
