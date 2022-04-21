vim.opt.list = true

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  filetype_exclude = {
    "help",
    "dashboard",
    "dashpreview",
    "NvimTree",
    "vista",
    "sagahover",
    "defx",
    "prompt",
    "TelescopePrompt",
    "",
    "toggleterm"
  },
  buftype_exclude = {
    "terminal",
    "quickfix"
    -- "nofile",
  }
}
