local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          -- vim.cmd [[Telescope quickfix]]
          vim.cmd [[botright copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          -- vim.cmd [[Telescope quickfix]]
          vim.cmd [[botright copen]]
        end
      },
      n = {
        ["<C-h>"] = action_layout.toggle_preview,
        ["<M-q>"] = function(res)
          actions.send_selected_to_qflist(res)
          -- vim.cmd [[Telescope quickfix]]
          vim.cmd [[botright copen]]
        end,
        ["<C-q>"] = function(res)
          actions.send_to_qflist(res)
          -- vim.cmd [[Telescope quickfix]]
          vim.cmd [[botright copen]]
        end
      }
    },
    vimgrep_arguments = {"rg", "--column", "--ignore-case", "--hidden", "--multiline"},
    preview = {
      timeout = false
      -- hide_on_startup = true
    },
    cache_picker = {
      num_pickers = 20,
      limit_entries = 100
    },
  },
  pickers = {
    find_files = {
      -- theme = "center",
      layout_strategy = "vertical",
      layout_config = {
        -- width = 0.9,
        width = 0.5,
        height = 0.95,
        -- preview_cutoff = 36,
        preview_cutoff = 0,
        anchor="E",
        -- mirror=true,
        -- prompt_position = "top",
        -- height=0.7
      }
      -- winblend = 90
    },
    live_grep = {
      -- theme = "dropdown",
      layout_strategy = "vertical",
      layout_config = {
        -- width = 0.9,
        width = 0.5,
        height = 0.95,
        -- preview_cutoff = 36,
        preview_cutoff = 0,
        anchor="E",
        -- prompt_position = "bottom",
        -- height=0.7
        -- prompt_position = "top",
      },

      -- winblend = 90
    },
    resume = {
      layout_strategy = "vertical",
      layout_config = {
        -- width = 0.9,
        width = 0.5,
        height = 0.95,
        -- preview_cutoff = 36,
        preview_cutoff = 0,
        anchor="E",
      },
      initial_mode = "normal"
    },
    pickers = {
      layout_strategy = "vertical",
      layout_config = {
        -- width = 0.9,
        width = 0.5,
        height = 0.95,
        -- preview_cutoff = 36,
        preview_cutoff = 0,
        anchor="E",
      },
      initial_mode = "normal"
    },
    oldfiles = {
      layout_strategy = "vertical",
      layout_config = {
        -- width = 0.9,
        width = 0.5,
        height = 0.95,
        -- preview_cutoff = 36,
        preview_cutoff = 0,
        anchor="E",
      },
      initial_mode = "normal"
    }
  }
}
