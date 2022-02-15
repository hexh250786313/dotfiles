local nvim_lsp = require "lspconfig"
local api = vim.api
local lsp = vim.lsp

function show_line_diagnostics()
  local opts = {
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    -- border = 'rounded',
    source = 'always',
    prefix = ' '
  }
  vim.diagnostic.open_float(nil, opts)
end

local custom_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    api.nvim_buf_set_keymap(bufnr, ...)
  end

  vim.cmd([[
    autocmd CursorHold <buffer> lua show_line_diagnostics()
  ]])

  if client.resolved_capabilities.document_formatting then
    -- buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    -- buf_set_keymap("x", "<space>bf", "<cmd>lua vim.lsp.buf.range_formatting()<CR><ESC>", opts)
  end
end

nvim_lsp.tsserver.setup{
  on_attach = custom_attach
}

nvim_lsp.diagnosticls.setup {
  filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss"},
  init_options = {
    filetypes = {
      javascript = "eslint",
      typescript = "eslint",
      javascriptreact = "eslint",
      typescriptreact = "eslint"
    },
    linters = {
      eslint = {
        sourceName = "eslint",
        command = "./node_modules/.bin/eslint",
        rootPatterns = {
          ".eslitrc.js",
          "package.json",
        },
        debounce = 100,
        args = {
          "--cache",
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      }
    }
  }
}

vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "!", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInformation", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

lsp.handlers["textDocument/hover"] = lsp.with(vim.lsp.handlers.hover, {
  -- border = "rounded",
})
