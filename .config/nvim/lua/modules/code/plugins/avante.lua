local wk = require("which-key")
wk.register({
  mode = { "n", "x" },
  ["<leader>ca"] = { "<cmd>lua require('avante.api').ask()<cr>", "avante: ask" },
  ["<leader>ce"] = { "<cmd>lua require('avante.api').edit()<cr>", "avante: edit" },
})
wk.register({
  mode = { "n" },
  ["<leader>cr"] = { "<cmd>require('avante.api').refresh()<cr>", "avante: refresh" },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "AvanteInput", "Avante" },
  callback = function()
    require("lualine").hide()
  end,
})

-- Function to hide lualine and close the window
local function on_leave_avante()
  require("lualine").hide({ unhide = true })
  vim.cmd("close")
end

-- Create autocommands
-- vim.api.nvim_create_autocmd("BufLeave", {
--   pattern = { "*.AvanteInput", "*.Avante" },
--   callback = on_leave_avante,
-- })

-- vim.api.nvim_create_autocmd("WinLeave", {
--   pattern = { "*.AvanteInput", "*.Avante" },
--   callback = on_leave_avante,
-- })

require("avante_lib").load()
require("avante").setup({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = "copilot", -- Recommend using Claude
  auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  windows = {
    width = 50,
  },
  -- claude = {
  --   endpoint = "https://api.anthropic.com",
  --   model = "claude-3-5-sonnet-20240620",
  --   temperature = 0,
  --   max_tokens = 4096,
  -- },
  mappings = {
    ask = "<leader>ca", -- ask
    edit = "<leader>ce", -- edit
    refresh = "<leader>cr", -- refresh
    --- @class AvanteConflictMappings
    -- diff = {
    --   ours = "co",
    --   theirs = "ct",
    --   all_theirs = "ca",
    --   both = "cb",
    --   cursor = "cc",
    --   next = "]x",
    --   prev = "[x",
    -- },
    -- suggestion = {
    --   accept = "<M-l>",
    --   next = "<M-]>",
    --   prev = "<M-[>",
    --   dismiss = "<C-]>",
    -- },
    -- jump = {
    --   next = "]]",
    --   prev = "[[",
    -- },
    -- submit = {
    --   normal = "<CR>",
    --   insert = "<C-s>",
    -- },
    -- sidebar = {
    --   switch_windows = "<Tab>",
    --   reverse_switch_windows = "<S-Tab>",
    -- },
  },
})
