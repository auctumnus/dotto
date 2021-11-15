-- Sets up plugins.
vim.cmd [[packadd packer.nvim]]

vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'package-lock.json' }
vim.g.nvim_tree_icons = {
  git = {
    unstaged  = '',
    staged    = '',
    untracked = '',
    renamed   = '',
    unmerged  = '',
    deleted   = '☒',
    ignored   = '☒'
  },
  folder = {
    arrow_open   = '⏷',
    arrow_closed = '⏵'
  }
}

vim.g.coq_settings = {
  auto_start = true
}

return require('packer').startup(function()
  -- Packer, our package manager
  use 'wbthomason/packer.nvim'

  -- Nerdtree
  use {
    'preservim/nerdtree',
    'Xuyuanp/nerdtree-git-plugin'
  }

  -- Lualine
  use {
    'hoob3rt/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require'nvim-tree'.setup(require'nvim_tree') end
  }

  -- Language servers
  -- use {'neoclide/coc.nvim', branch = 'release'}
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'b0o/schemastore.nvim'

  -- Completion
  --use 'ms-jpq/coq_nvim'
  --use 'ms-jpq/coq.artifacts'

  --use 'ms-jpq/coq.thirdparty'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  -- treesitter
  use 'nvim-treesitter/nvim-treesitter'

  -- Better typescript highlighting than the built-in
  use 'leafgarland/typescript-vim'

  -- Vue highlighting
  use 'leafOfTree/vim-vue-plugin'

  -- Colorscheme
  use 'auctumnus/wal.vim'

  -- Splitjoin
  use 'AndrewRadev/splitjoin.vim'
end)
