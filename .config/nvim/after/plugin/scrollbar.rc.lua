require("scrollbar").setup(
  {
    show = false,
    handle = {
      text = " ",
      color = "#344f69",
      hide_if_all_visible = true -- Hides handle if all lines are visible
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      ""
    },
    excluded_buftypes = {
      "terminal"
    },
    autocmd = {
      render = {
        "BufWinEnter",
        "TabEnter",
        "TermEnter",
        "WinEnter",
        "CmdwinLeave",
        "TextChanged",
        "VimResized",
        "WinScrolled"
      }
    },
    handlers = {
      diagnostic = false,
      search = false -- Requires hlslens to be loaded
    }
  }
)
