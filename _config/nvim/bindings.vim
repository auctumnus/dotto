" Bindings are much easier to write in Vimscript than Lua.
" Also, I can just copy stuff way easier, and it's just about as readable.

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

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

" insert timestamp
nmap <F3> i<C-R>=strftime("%Ft%T%z")<CR><Esc>
imap <F3> <C-R>=strftime("%Ft%T`%z")<CR>

" open terminal w ^n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" nvimtree
nnoremap <C-b> :NvimTreeFocus<CR>


