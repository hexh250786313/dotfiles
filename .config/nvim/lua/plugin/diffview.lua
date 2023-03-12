local actions = require("diffview.actions")

require "diffview".setup {
  view = {
    merge_tool = {
      -- Config for conflicted files in diff views during a merge or rebase.
      layout = "diff3_mixed",
      disable_diagnostics = true -- Temporarily disable diagnostics for conflict buffers while in the view.
    }
  },
  file_history_panel = {
    win_config = {
      height = 9
    }
  },
  file_panel = {
    listing_style = "list"
  },
  hooks = {
    diff_buf_read = function(bufnr)
      -- Change local options in diff buffers
      -- vim.cmd("call CocPrint(" .. bufnr .. ")")
      vim.cmd(":IndentBlanklineDisable")
      vim.cmd(":setlocal nocursorline")
      vim.opt_local.wrap = false
      -- vim.opt_local.list = false
      -- vim.opt_local.colorcolumn = {80}
    end
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
        vim.cmd(":tabclose #")
      end
    },
    file_panel = {
      ["<c-j>"] = actions.select_next_entry,
      ["<c-k>"] = actions.select_prev_entry,
      ["<up>"] = actions.scroll_view(-0.25), -- Scroll the view up
      ["<down>"] = actions.scroll_view(0.25), -- Scroll the view down
      ["s"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["o"] = function(opt)
        actions.goto_file_edit(opt)
        vim.cmd(":tabclose #")
      end
    },
    file_history_panel = {
      ["<c-j>"] = actions.select_next_entry,
      ["<c-k>"] = actions.select_prev_entry,
      ["<up>"] = actions.scroll_view(-0.25), -- Scroll the view up
      ["<down>"] = actions.scroll_view(0.25), -- Scroll the view down
      ["o"] = function(opt)
        actions.goto_file_edit(opt)
        vim.cmd(":tabclose #")
      end
    }
  }
}

vim.cmd(
  [[
nnoremap <silent> <Space>gt :DiffviewFileHistory %<CR>
nnoremap <silent> <Space>gT :DiffviewFileHistory<CR>
nnoremap <silent> <Space>gg :DiffviewOpen<CR>
]]
)
