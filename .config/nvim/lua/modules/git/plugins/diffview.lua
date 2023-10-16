---- 快捷键
local wk = require("which-key")
wk.register({
  mode = { "n" },
  ["<leader>gt"] = { "<cmd>DiffviewFileHistory %<cr>", "Git History" },
  ["<leader>gT"] = { "<cmd>DiffviewFileHistory<cr>", "Git History for current file" },
  ["<leader>gG"] = { "<cmd>DiffviewOpen<cr>", "Git status" },
})

---- 配置
local actions = require("diffview.actions")

require"diffview".setup {
  view = {
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      layout = "diff3_mixed",
      disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
    },
  },
  file_history_panel = {
    -- win_config = { height = 9, width = 35, position = "top" },
    win_config = function()
      local c = { type = "float" }
      local editor_width = vim.o.columns
      local editor_height = vim.o.lines
      c.width = math.min(200, editor_width)
      c.height = math.min(33, editor_height)
      c.col = math.floor(editor_width * 0.5 - c.width * 0.5)
      c.row = math.floor(editor_height * 0.5 - c.height * 0.5)
      return c
    end,
  },
  file_panel = { listing_style = "list" },
  hooks = {
    diff_buf_read = function(bufnr)
      -- Change local options in diff buffers
      -- vim.cmd("call CocPrint(" .. bufnr .. ")")
      -- vim.cmd(":IndentBlanklineDisable")
      vim.cmd(":setlocal nocursorline")
      vim.opt_local.wrap = false
      vim.opt_local.winbar = ''
      -- vim.opt_local.list = false
      -- vim.opt_local.colorcolumn = {120}
    end,
  },
  keymaps = {
    view = {
      ["<c-j>"] = actions.select_next_entry,
      ["<c-k>"] = actions.select_prev_entry,
      ["co"] = actions.conflict_choose("ours"),
      ["ct"] = actions.conflict_choose("theirs"),
      ["cb"] = actions.conflict_choose("all"),
      ["c1"] = actions.conflict_choose("base"),
      ["c0"] = actions.conflict_choose("none"),
      ["o"] = function(opt)
        actions.goto_file_edit(opt)
      end,
      ["O"] = function(opt)
        actions.goto_file_edit(opt)
        vim.cmd(":call timer_start(50, { -> function(g:diffview_config_sid . 'CLOSE_TAB')() })")
      end,
    },
    file_panel = {
      ["<c-j>"] = actions.select_next_entry,
      ["<c-k>"] = actions.select_prev_entry,
      ["<up>"] = actions.scroll_view(-0.01), -- Scroll the view up
      ["<down>"] = actions.scroll_view(0.01), -- Scroll the view down
      -- ["<up>"] = actions.scroll_view(-0.25), -- Scroll the view up
      -- ["<down>"] = actions.scroll_view(0.25), -- Scroll the view down
      ["s"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["o"] = function(opt)
        actions.goto_file_edit(opt)
      end,
      ["O"] = function(opt)
        actions.goto_file_edit(opt)
        vim.cmd(":call timer_start(50, { -> function(g:diffview_config_sid . 'CLOSE_TAB')() })")
      end,
    },
    file_history_panel = {
      ["<c-j>"] = actions.select_next_entry,
      ["<c-k>"] = actions.select_prev_entry,
      ["<up>"] = actions.scroll_view(-0.01), -- Scroll the view up
      ["<down>"] = actions.scroll_view(0.01), -- Scroll the view down
      -- ["<up>"] = actions.scroll_view(-0.25), -- Scroll the view up
      -- ["<down>"] = actions.scroll_view(0.25), -- Scroll the view down
      ["o"] = function(opt)
        actions.goto_file_edit(opt)
      end,
      ["O"] = function(opt)
        actions.goto_file_edit(opt)
        vim.cmd(":call timer_start(50, { -> function(g:diffview_config_sid . 'CLOSE_TAB')() })")
      end,
    },
  },
}

vim.cmd([[
function! s:CLOSE_TAB()
  :tabclose #
endfunction

" 获取识别码
function! s:SID_PREFIX() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" 添加全局识别码
let g:diffview_config_sid = s:SID_PREFIX()
" let g:asyncrun_runner.exec = function(g:asyncrun_runner_exec_config_sid . 'TOGGLE_TERM_EXEC')
]])
