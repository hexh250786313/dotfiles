require("CopilotChat").setup({
  selection = nil,
  debug = false, -- Enable debugging
  show_help = false,
  -- model = "claude-3.5-sonnet",
  model = "claude-3.7-sonnet-thought",
  -- model = "o1-preview",
  -- model = "o1-mini",
  -- See Configuration section for rest
  mappings = { reset = { normal = "<C-q>", insert = "<C-q>" } },
  prompts = {
    Chinese = {
      prompt = "Who are you?",
      description = "请用中文回答所有问题",
      system_prompt = "请用中文回答所有问题。",
    },
  },
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
