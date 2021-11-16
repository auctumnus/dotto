local lspconfig = require('lspconfig')

-- coq
vim.g.coq_settings = {
  auto_start = 'shut-up',
  display = {
    icons = {
      mode = "long",
      -- these icons work best w cozette
      mappings = {
        Boolean       = '',
        Character     = '',
        Class         = '',
        Color         = '',
        Constant      = 'π',
        Constructor   = '',
        Enum          = '',
        EnumMember    = '',
        Event         = '',
        Field         = '',
        File          = '',
        Folder        = '',
        Function      = '➜',
        Interface     = '⬢',
        Keyword       = '',
        Method        = '',
        Module        = '',
        Number        = '',
        Operator      = '',
        Parameter     = '$',
        Property      = '',
        Reference     = '',
        Snippet       = '',
        String        = '',
        Struct        = '',
        Text          = '',
        TypeParameter = '',
        Value         = '',
        Variable      = '﵂'
      }
    },
    pum = {
      source_context = {
        "❬", "❭"
      }
    }
  },
  clients = {
    lsp = {
      weight_adjust = 0.8
    }
  }
}

local coq = require('coq')

require('coq_3p') {
  { src = 'nvimlua', short_name = "nLUA" }
}

local servers = {
  'tsserver',
  'pyright',
  'rust_analyzer'
}

local capabilities = vim.lsp.protocol.make_client_capabilities()

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
    capabilities = capabilities,
    on_attach = function (_, bufnr)
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end
  }))
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

vim.o.completeopt = 'menuone,noselect'
