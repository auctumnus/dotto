require 'colors'
require 'plugins'
require 'lualine_conf'
require 'settings'
require 'lsp'
require 'treesitter'

-- Keybindings
vim.cmd([[source ~/.config/nvim/bindings.vim]])

vim.api.nvim_command('colorscheme wal')

vim.cmd([[au BufRead,BufNewFile *.kdl set filetype=kdl]])

local parser_config = require"nvim-treesitter.parsers".get_parser_configs()

parser_config.kdl = {
  install_info = {
    url = "~/projects/unoqwy-tree-sitter-kdl",
    files = { "src/parser.c" }
  },
  filetype = "kdl"
}

-- Start in insert mode
vim.api.nvim_command('startinsert')
