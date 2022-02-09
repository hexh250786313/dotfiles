local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require('telescope').setup {
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
    vimgrep_arguments = { 'rg', '--column', '--ignore-case', '--hidden', '--multiline' },
    preview = {
      timeout = false,
      -- hide_on_startup = true
    },
  },
}

require('telescope').load_extension('coc')
