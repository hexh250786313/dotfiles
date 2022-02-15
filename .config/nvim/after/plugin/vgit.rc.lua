require("vgit").setup(
  {
    settings = {
      live_gutter = {
        enabled = true
      },
      live_blame = {
        enabled = true
      },
      authorship_code_lens = {
        enabled = false
      },
      screen = {
        diff_preference = "split"
      }
    }
  }
)

-- 配置不管用时, 下面的可以放到 init.vim 里面去
-- au VimEnter * call timer_start(2000, { tid -> execute('VGit toggle_live_gutter') })
-- " au VimEnter * call timer_start(2000, { tid -> execute('VGit toggle_diff_preference') })
-- au VimEnter * call timer_start(2000, { tid -> execute('VGit toggle_live_blame') })
