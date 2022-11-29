local M = {}

require("spectre").setup(
  {
    is_insert_mode = false,
    live_update = true,
    line_sep_start = "┌───────────────────────────────────────",
    result_padding = "│  ",
    line_sep = "└───────────────────────────────────────",
    mapping = {
      ["send_to_qf"] = {
        map = "<c-q>",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR> | <cmd>lua require('spectre').close()<CR>",
        desc = "send all item to quickfix"
      },
      ["run_replace"] = {
        map = "<c-s>",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all"
      }
    },
    find_engine = {
      ["rg"] = {
        cmd = "rg",
        args = {
          "--column",
          -- "--ignore-case",
          "--hidden",
          "--multiline",
          "--sort-files",
          "--vimgrep" -- for result in same line, usually, it is not useful for searching but useful for replacing
        }
      }
    },
    -- default = {replace = {cmd = "oxi"}}
  }
)

M.spectre_state = require("spectre.actions").get_state()
M.is_file = M.spectre_state.query.is_file
M.path = M.spectre_state.query.path
M.replace_query = M.spectre_state.query.replace_query
M.search_query = M.spectre_state.query.search_query
M.search_resume = function(is_insert_mode)
  M.spectre_state = require("spectre.actions").get_state()
  M.is_file = M.spectre_state.query.is_file
  M.path = M.spectre_state.query.path
  M.replace_query = M.spectre_state.query.replace_query
  M.search_query = M.spectre_state.query.search_query
  require("spectre").open(
    {
      is_insert_mode = is_insert_mode,
      search_text = M.search_query,
      replace_text = M.replace_query,
      path = M.path
    }
  )
end

vim.cmd(
  [[
" nnoremap <silent> <Space>sg <esc>:lua require('spectre').open()<CR>
nnoremap <silent> <Space>sg <esc>:lua require('plugin.nvim-spectre').search_resume(true)<CR>
vnoremap <silent> <Space>sg <esc>:lua require('spectre').open_visual()<CR>
  ]]
)

return M
