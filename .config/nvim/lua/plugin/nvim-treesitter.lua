require("nvim-treesitter.configs").setup {
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
    enable = false,
    extended_mode = true,
    max_file_lines = 10000
  }
}
