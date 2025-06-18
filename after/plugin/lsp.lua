-- LSP Configuration
local function setup_lsp()
  -- Check if all required plugins are available
  local lsp_zero_ok, lsp_zero = pcall(require, 'lsp-zero')
  local mason_ok, mason = pcall(require, 'mason')
  local mason_lspconfig_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
  
  if not lsp_zero_ok or not mason_ok or not mason_lspconfig_ok then
    vim.notify("LSP setup failed: required plugins not found", vim.log.levels.WARN)
    return
  end

  -- Setup mason first
  mason.setup()

  -- Setup lsp-zero
  lsp_zero.preset('recommended')

  lsp_zero.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
    'gopls'
  })

  lsp_zero.set_preferences({
    sign_icons = {}
  })

  lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-z>", function() vim.lsp.buf.signature_help() end, opts)
  end)

  -- Setup mason-lspconfig
  mason_lspconfig.setup({
    ensure_installed = {
      'tsserver',
      'eslint',
      'sumneko_lua',
      'rust_analyzer',
      'gopls'
    },
    automatic_installation = true,
  })

  lsp_zero.setup()
end

-- Setup LSP after plugins are loaded
vim.defer_fn(setup_lsp, 200)
