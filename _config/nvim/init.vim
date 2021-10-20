
call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
  " git
  Plug 'f-person/git-blame.nvim'
  Plug 'tpope/vim-fugitive'
  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
  " zig
  Plug 'ziglang/zig.vim'
  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  " GraphQL
  Plug 'jparise/vim-graphql'
  " Vue support
  Plug 'leafOfTree/vim-vue-plugin'
  " Tailwind
  Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
  " Prettier setup
  Plug 'sbdchd/neoformat'
  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " dev icons
  Plug 'ryanoasis/vim-devicons'
  " pywal theme
  Plug 'auctumnus/wal.vim'
call plug#end()

colorscheme wal

au BufNewFile,BufRead *.prisma setfiletype graphql

"Config Section
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^node_modules$', '^package-lock.json$']
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" nerdtree symbols
let g:NERDTreeDirArrowExpandable = '⏵'
let g:NERDTreeDirArrowCollapsible = '⏷'

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'',
                \ 'Staged'    :'',
                \ 'Untracked' :'',
                \ 'Renamed'   :'',
                \ 'Unmerged'  :'',
                \ 'Deleted'   :'☒',
                \ 'Dirty'     :'',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

tnoremap <A-Left> <C-\><C-n><C-w>h
tnoremap <A-Down> <C-\><C-n><C-w>j
tnoremap <A-Up> <C-\><C-n><C-w>k
tnoremap <A-Right> <C-\><C-n><C-w>l
nnoremap <A-Left> <C-w>h
nnoremap <A-Down> <C-w>j
nnoremap <A-Up> <C-w>k
nnoremap <A-Right> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" run prettier on save
"augroup fmt
"  autocmd!
"  autocmd BufWritePre *.ts undojoin | Neoformat prettier
"  autocmd BufWritePre *.js undojoin | Neoformat prettier
"  autocmd BufWritePre *.json undojoin | Neoformat prettier
"  autocmd BufWritePre *.css undojoin | Neoformat prettier
"  autocmd BufWritePre *.vue undojoin | Neoformat prettier
"augroup END

" column at 80 lines
set colorcolumn=80
highlight ColorColumn ctermbg=8 guibg=lightgrey

" line numbers
set number

" powerline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.dirty='⚡'

" use spaces instead of tabs
set list
set listchars=tab:→\ ,trail:·,extends:…,precedes:…

set expandtab
set shiftwidth=2
set softtabstop=2

nmap <F3> i<C-R>=strftime("%Ft%T%z")<CR><Esc>
imap <F3> <C-R>=strftime("%Ft%T`%z")<CR>

" reload files if they get changed
set autoread
" linebreak
set linebreak
" start in insert mode
startinsert

