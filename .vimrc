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

Plug 'w0rp/ale'

Plug 'neovimhaskell/haskell-vim'

Plug 'alx741/vim-stylishask'

Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'skywind3000/asyncrun.vim'

Plug 'conornewton/vim-pandoc-markdown-preview'

Plug 'lingnand/pandoc-preview.vim'

Plug 'jpalardy/vim-slime'

call plug#end()

filetype plugin indent on

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

" Markdown
let vim_markdown_preview_pandoc=1
let g:pandoc_preview_pdf_cmd = "zathura" 
let g:md_pdf_viewer="zathura"

