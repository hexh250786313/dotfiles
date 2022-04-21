local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[botright copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[botright copen]]
        end
      },
      n = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          vim.cmd [[botright copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          vim.cmd [[botright copen]]
        end
      }
    },
    vimgrep_arguments = {"rg", "--column", "--ignore-case", "--hidden", "--multiline"},
    preview = {
      timeout = false
    },
    cache_picker = {
      num_pickers = 20,
      limit_entries = 100
    }
  },
  pickers = {
    find_files = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      }
    },
    live_grep = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      }
    },
    resume = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    },
    pickers = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    },
    oldfiles = {
      layout_strategy = "vertical",
      layout_config = {
        width = 0.5,
        height = 0.95,
        preview_cutoff = 0,
        anchor = "E"
      },
      initial_mode = "normal"
    }
  }
}
