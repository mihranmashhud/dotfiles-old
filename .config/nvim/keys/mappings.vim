" Mappings for days
" Leader
let mapleader=" "
" let localleader=" "
nnoremap <Space> <Nop>

" Indent and keep what was indented highlighted
vnoremap < <gv
vnoremap > >gv

if exists('g:vscode')
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
else
  " Omnicomplete navigation
  inoremap <expr> <c-j> ("\<C-n>")
  inoremap <expr> <c-k> ("\<C-p>")

  " No need for hitting escape
  inoremap jk <Esc>
  inoremap kj <Esc>

  " Move through buffers using tab
  nnoremap <silent> <TAB> :bnext<CR>
  nnoremap <silent> <S-TAB> :bprevious<CR>

  " Why press shift semicolon when you can press semicolon?
  nnoremap ; :
  nnoremap : ;

  " Tab completion in insert mode
  inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

  " Better window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " Terminal window navigation
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l
  inoremap <C-h> <C-\><C-N><C-w>h
  inoremap <C-j> <C-\><C-N><C-w>j
  inoremap <C-k> <C-\><C-N><C-w>k
  inoremap <C-l> <C-\><C-N><C-w>l
  tnoremap <Esc> <C-\><C-n>

  " Use alt + hjkl to resize windows
  nnoremap <silent> <M-j>    :resize -2<CR>
  nnoremap <silent> <M-k>    :resize +2<CR>
  nnoremap <silent> <M-h>    :vertical resize -2<CR>
  nnoremap <silent> <M-l>    :vertical resize +2<CR>
endif
