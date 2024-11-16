require("CopilotChat").setup({
  debug = false, -- Enable debugging
  show_help = false,
  -- model = "claude-3.5-sonnet",
  -- model = "o1-preview",
  -- model = "o1-mini",
  -- See Configuration section for rest
  mappings = { reset = { normal = "<C-q>", insert = "<C-q>" } },
})

-- Create an autocmd for copilot-chat file type
vim.api.nvim_create_autocmd("FileType", {
  pattern = "copilot-chat",
  callback = function()
    vim.defer_fn(function()
      vim.cmd("only")
      require("lualine").hide()
      require("mini.map").close()
    end, 50)
  end,
})
