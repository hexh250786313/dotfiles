require("spectre").setup(
  {
    line_sep_start = "┌─────────────────────────────────────────",
    result_padding = "│  ",
    line_sep = "└─────────────────────────────────────────",
    mapping = {
      ["send_to_qf"] = {
        map = "<c-q>",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
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
          "--ignore-case",
          "--hidden",
          "--multiline",
          "--vimgrep"
        }
      }
    },
    default = {replace = {cmd = "oxi"}}
  }
)

vim.cmd(
  [[
nnoremap <silent> <Space>sg <esc>:lua require('spectre').open()<CR>i
vnoremap <silent> <Space>sg <esc>:lua require('spectre').open_visual()<CR>
  ]]
)
