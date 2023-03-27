require("bqf").setup(
  {
    preview = {
      win_vheight = 25
    },
    func_map = {
      pscrollup = "<Up>",
      pscrolldown = "<Down>"
    },
    filter = {
      fzf = {
        extra_opts = {"--bind", "ctrl-a:toggle-all"}
      }
    }
  }
)
