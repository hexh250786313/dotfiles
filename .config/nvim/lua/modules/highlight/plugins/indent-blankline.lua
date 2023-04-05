---------> 配置
vim.opt.list = true
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false, -- 是否展示第一级
  filetype_exclude = {
    "help",
    "dashboard",
    "dashpreview",
    "NvimTree",
    "vista",
    "sagahover",
    "defx",
    "prompt",
    "TelescopePrompt",
    "",
    "toggleterm",
    "list"
  },
  buftype_exclude = {
    "terminal",
    "quickfix"
    -- "nofile",
  },
  char_highlight_list = {
    "IndentBlanklineIndent"
  }
}

---------> autocmd
vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    group = vim.api.nvim_create_augroup("IndentBlanklineBigFileEnable", {}),
    pattern = "*",
    callback = function()
      local max_filesize = 50 * 1024 -- 50 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
      if ok and stats and stats.size < max_filesize then
        require("indent_blankline.commands").enable()
      end
    end
  }
)

vim.api.nvim_create_autocmd(
  "BufReadPre",
  {
    group = vim.api.nvim_create_augroup("IndentBlanklineBigFileDisable", {}),
    pattern = "*",
    callback = function()
      require("indent_blankline.commands").disable()
      -- end
    end
  }
)
