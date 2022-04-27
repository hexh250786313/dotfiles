require("scrollbar").setup(
  {
    show = true,
    handle = {
      text = " ",
      color = "#344f69",
      hide_if_all_visible = true -- Hides handle if all lines are visible
    },
    excluded_filetypes = {
      "prompt",
      "TelescopePrompt",
      "defx",
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
      diagnostic = true,
      search = false -- Requires hlslens to be loaded
    }
  }
)
