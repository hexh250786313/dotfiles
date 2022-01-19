local actions = require "telescope.actions"

require('telescope').setup {
defaults = {
    mappings = {
      i = {
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
    },
  },
}

require('telescope').load_extension('coc')
