local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})
local lsp = require('lsp-zero')

cmp.setup({
  sources = ({
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'nvim-lua' },
    { name = 'buffer' },
    { name = 'path' },
  }),
  snippet = ({
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  }),
  window = ({
    completion = cmp.config.window.bordered(),
    documentation = ({
      border = "rounded",
      winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopePromptBorder",
      max_width = 80,
      max_height = 30,
    }),
  }),
  formatting = cmp_format,
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Enter>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
