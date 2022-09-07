require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = false
  },
  indent = {
    enable = false
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 10000
  }
}

vim.keymap.set("n", "<space>tr", ":TSToggle rainbow<cr>", {silent = true})
