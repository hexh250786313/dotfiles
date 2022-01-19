require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = false
  },
  rainbow = {enable = true, extended_mode = true, max_file_lines = 10000},
  -- matchup = {
    -- enable = true,
  -- },
}

