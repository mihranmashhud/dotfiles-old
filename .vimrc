" Syntax ON
syntax on

" Leader key
let mapleader = ","

" Colorscheme & Lightline
let g:lightline = {
\ 'colorscheme': 'snazzy',
\ }
set laststatus=2
set noshowmode
colorscheme snazzy
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
set t_Co=16
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

" Word Wrap
set wrap linebreak nolist

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
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set whichwrap+=<,>,h,l,[,]
set virtualedit=onemore

" Coc -------------------------------------------------------------------
nnoremap <leader> F :call CocAction('format')<CR>
nmap <leader>qf  <Plug>(coc-fix-current)

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }


"Plug-ins
call plug#begin('~/.vim/plugged')

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'wlangstroth/vim-racket'

Plug 'connorholyday/vim-snazzy'

Plug 'itchyny/lightline.vim'

Plug 'yuttie/comfortable-motion.vim'

Plug 'dense-analysis/ale'

Plug 'neovimhaskell/haskell-vim'

Plug 'alx741/vim-stylishask'

Plug 'tpope/vim-surround'

" Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'skywind3000/asyncrun.vim'

Plug 'conornewton/vim-pandoc-markdown-preview'

" Plug 'lingnand/pandoc-preview.vim'

Plug 'jpalardy/vim-slime'

Plug 'godlygeek/tabular'

Plug 'tpope/vim-markdown'

" Plug 'vim-pandoc/vim-pandoc'

Plug 'junegunn/goyo.vim'

Plug 'scrooloose/nerdcommenter'

Plug 'kjwon15/vim-transparent'

call plug#end()

filetype plugin indent on

" Writing
"   Word count:
nnoremap <F3> :w !detex \| wc -w<CR> 
"let vim_markdown_preview_pandoc=1
let g:md_pdf_viewer="zathura"
let g:md_args="--filter pandoc-citeproc -V fontsize=12pt"
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.Rmd setlocal spell
autocmd BufNewfile,BufRead *.Rmd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Ale
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'markdown': ['languagetool','proselint'] 
\}

" RASI Syntax
au BufNewFile,BufRead /*.rasi setf css
