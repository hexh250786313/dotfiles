require("bqf").setup({
  auto_resize_height = true, -- qf 列表窗口自适应高度，但是不会超过默认高度（vim 默认 10，我用 bqf.sh hack 到了 6，和 coc-lists 的设置保持一致）
  preview = {win_vheight = 25, winblend = 0, win_height = 21},
  func_map = {pscrollup = "<Up>", pscrolldown = "<Down>"},
  filter = {fzf = {extra_opts = {"--bind", "ctrl-a:toggle-all"}}}
})
