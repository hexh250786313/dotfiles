require("scrollview").setup(
  {
    auto_mouse = true,
    excluded_filetypes = {"list"},
    current_only = true
  }
)

vim.cmd([[
highlight ScrollView guibg=#2f628e guifg=NONE
]])
