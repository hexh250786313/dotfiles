require("scrollbar").setup(
  {
    excluded_filetypes = {
      "list",
      "spectre_panel",
      "defx",
      "prompt",
      "TelescopePrompt",
      "markdown"
    },
    set_highlights = false,
    marks = {
      Error = {
        text = {"∎", "∎"},
        priority = 1
      },
      Warn = {
        text = {"∎", "∎"},
        priority = 2
      },
      Info = {
        text = {"∎", "∎"},
        priority = 3
      },
      Hint = {
        text = {"∎", "∎"},
        priority = 4
      },
      Misc = {
        text = {"∎", "∎"},
        priority = 5
      }
    }
  }
)
