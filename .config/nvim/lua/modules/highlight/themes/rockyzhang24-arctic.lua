local M = {}

M.name = "rockyzhang24/arctic.nvim"
M.branch = "v2"
M.requires = { "rktjmp/lush.nvim" }

function M.setup()
  vim.cmd([[ colorscheme arctic ]])
end

return M
