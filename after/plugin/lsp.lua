local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
  'gopls'
})

lsp.set_preferences({
  sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn>", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-z>", function() vim.lsp.buf.signature_help() end, opts)
  
  -- Additional diagnostic mappings for better error visibility
  vim.keymap.set("n", "<leader>dl", function() vim.diagnostic.setloclist() end, opts) -- Show all diagnostics in location list
  vim.keymap.set("n", "<leader>dq", function() vim.diagnostic.setqflist() end, opts) -- Show all diagnostics in quickfix list
  vim.keymap.set("n", "<leader>di", function() vim.diagnostic.show() end, opts) -- Show diagnostics for current line
  vim.keymap.set("n", "<leader>dh", function() vim.diagnostic.hide() end, opts) -- Hide diagnostics
end)

lsp.setup()
