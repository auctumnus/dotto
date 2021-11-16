require 'colors'
require 'plugins'
require 'lualine_conf'
require 'settings'
require 'lsp'
require 'treesitter'

-- Keybindings
vim.cmd([[source ~/.config/nvim/bindings.vim]])

vim.api.nvim_command('colorscheme wal')

-- Start in insert mode
vim.api.nvim_command('startinsert')
