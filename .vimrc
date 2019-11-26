" Syntax ON
syntax on

" Colorscheme & Lightline
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
set laststatus=2
set noshowmode
colorscheme snazzy
let $t_ut=''
if (&term =~ '^xterm' && &t_Co == 256)
  set t_ut= | set ttyscroll=1
endif
set cursorline

" Tab
set tabstop=2

" Tabs are spaces
set expandtab

" Line Numbers
set number relativenumber
set nu rnu

" Show command
set showcmd

" filetype detection
filetype indent on

" Wild menu
set wildmenu

" Lazy redrawing
set lazyredraw

" Highlight matching brackets
set showmatch

" Searching
set incsearch
set hlsearch

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Code folding
set foldenable
set foldlevelstart=10
" Key binding for code folding
nnoremap <space> za

set foldmethod=indent

" Movement
nnoremap j gj
nnoremap k gk
nnoremap $ $l
set whichwrap+=<,>,h,l,[,]
set virtualedit=onemore

"Plug-ins
call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'wlangstroth/vim-racket'

Plug 'connorholyday/vim-snazzy'

Plug 'itchyny/lightline.vim'

call plug#end()

filetype plugin indent on
