" Mappings for days

" Indent and keep what was indented highlighted
vnoremap < <gv
vnoremap > >gv

" Omnicomplete navigation
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" No need for hitting escape
inoremap jk <Esc>
inoremap kj <Esc>
tnoremap jk <Esc>
tnoremap kj <Esc>

" Why press shift semicolon when you can just press semicolon?
nnoremap ; :
nnoremap : ;

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j> :resize -2<CR>
nnoremap <silent> <M-k> :resize +2<CR>
nnoremap <silent> <M-h> :vertical resize -2<CR>
nnoremap <silent> <M-l> :vertical resize +2<CR>

" completion-nvim:
" Use <Tab> and <S-Tab> for completion
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)
