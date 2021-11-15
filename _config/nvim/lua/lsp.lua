local lspconfig = require('lspconfig')
--local coq = require('coq')
local cmp = require('cmp')

local servers = {
  'tsserver',
  'pyright',
  'rust_analyzer'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = function (_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
  })
end

-- lsp-specific setup
lspconfig.jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas()
    }
  }
})

require('rust-tools').setup({})

local luasnip = require 'luasnip'

-- completion
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'treesitter' },
    { name = 'nvim_lsp' }
  }
})

vim.o.completeopt = 'menuone,noselect'
