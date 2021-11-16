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
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'b0o/schemastore.nvim'

  -- Completion
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'

  use 'ms-jpq/coq.thirdparty'

  use 'kosayoda/nvim-lightbulb'

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
