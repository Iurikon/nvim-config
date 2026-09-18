-- nvim-treesitter main branch: the legacy 'nvim-treesitter.configs' module no longer exists.
local ts = require('nvim-treesitter')

-- Runs asynchronously and is a no-op for parsers that are already installed.
ts.install {
  'javascript',
  'typescript',
  'tsx',
  'json',
  'yaml',
  'css',
  'html',
  'go',
  'rust',
  'c',
  'lua',
  'vim',
  'vimdoc',
  'query',
}

-- Highlighting is no longer a module; start it per buffer, skipping filetypes
-- that have no installed parser.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
