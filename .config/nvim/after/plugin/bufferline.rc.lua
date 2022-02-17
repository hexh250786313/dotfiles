require("bufferline").setup {
  options = {
    -- separator_style = "padded_slant",
    separator_style = {"▓░", "░▓"},
    -- separator_style = {">", "<"},
    -- separator_style = {"", ""},
    -- separator_style = {"  ", "  "},
    -- separator_style = {"░▓", "▓░"},
    diagnostics = "coc",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    indicator_icon = " "
  },
  highlights = {
    fill = {
      guibg = "#282828"
    },
    background = {
      guifg = "#ffffff",
      guibg = "#373737"
    },
    tab = {
      guifg = "#ffffff",
      guibg = "#373737"
    },
    tab_selected = {
      guifg = "#ffffff",
      guibg = "#0a7aca"
    },
    tab_close = {
      guifg = "#ffffff",
      guibg = "#282828"
    },
    close_button = {
      guifg = "#ffffff",
      guibg = "#373737"
    },
    -- close_button_visible = {
    -- guifg = "#ffffff",
    -- guibg = "#373737"
    -- },
    close_button_selected = {
      guifg = "#ffffff",
      guibg = "#0a7aca"
    },
    -- buffer_visible = {
    -- guifg = "#ffffff",
    -- guibg = "#0a7aca"
    -- },
    buffer_selected = {
      guifg = "#ffffff",
      guibg = "#0a7aca",
      gui = "bold,italic"
    },
    -- diagnostic = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- diagnostic_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- diagnostic_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic"
    -- },
    -- info = {
    -- -- guifg = "<color-value-here>",
    -- -- guisp = "<color-value-here>",
    -- -- guibg = "<color-value-here>"
    -- guifg = "#ffffff",
    -- guibg = "#0a7aca",
    -- guisp = "#0a7aca",
    -- },
    -- info_visible = {
    -- guifg = "#ffffff",
    -- guibg = "#0a7aca",
    -- },
    -- info_selected = {
    -- -- guifg = "<color-value-here>",
    -- -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = "#0a7aca",
    -- guifg = "#ffffff",
    -- guibg = "#0a7aca"
    -- }
    -- info_diagnostic = {
    -- guifg = "<color-value-here>",
    -- guisp = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- info_diagnostic_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- info_diagnostic_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = "<color-value-here>"
    -- },
    -- warning = {
    -- guifg = "<color-value-here>",
    -- guisp = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- warning_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- warning_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = "<color-value-here>"
    -- },
    -- warning_diagnostic = {
    -- guifg = "<color-value-here>",
    -- guisp = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- warning_diagnostic_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- warning_diagnostic_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = warning_diagnostic_fg
    -- },
    -- error = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- guisp = "<color-value-here>"
    -- },
    -- error_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- error_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = "<color-value-here>"
    -- },
    -- error_diagnostic = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- guisp = "<color-value-here>"
    -- },
    -- error_diagnostic_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    -- error_diagnostic_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic",
    -- guisp = "<color-value-here>"
    -- },
    modified = {
      guifg = "#ffffff",
      guibg = "#373737"
    },
    -- modified_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>"
    -- },
    modified_selected = {
      guifg = "#ffffff",
      guibg = "#0a7aca"
    },
    -- duplicate_selected = {
    -- guifg = "<color-value-here>",
    -- gui = "italic",
    -- guibg = "<color-value-here>"
    -- },
    -- duplicate_visible = {
    -- guifg = "<color-value-here>",
    -- gui = "italic",
    -- guibg = "<color-value-here>"
    -- },
    -- duplicate = {
    -- guifg = "<color-value-here>",
    -- gui = "italic",
    -- guibg = "<color-value-here>"
    -- },
    -- separator_visible = {
    -- guifg = "#ffffff",
    -- guibg = "#ffffff"
    -- },
    -- separator = {
      -- guifg = "#ffffff",
      -- guibg = "#f951a8"
    -- },
    separator = {
      guifg = "#ffffff",
      guibg = "#0a7aca"
    },
    separator_selected = {
      guifg = "#ffffff",
      guibg = "#0a7aca"
    },
    indicator_selected = {
      guifg = "#0a7aca",
      guibg = "#0a7aca"
    }
    -- separator_selected = {
    -- guifg = "#282828"
    -- },
    -- separator_visible = {
    -- guifg = "#282828"
    -- },
    -- separator = {
    -- guifg = "#282828"
    -- }
    -- pick_selected = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic"
    -- },
    -- pick_visible = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic"
    -- },
    -- pick = {
    -- guifg = "<color-value-here>",
    -- guibg = "<color-value-here>",
    -- gui = "bold,italic"
    -- }
  }
}
