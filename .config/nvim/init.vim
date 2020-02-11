" Leader key {{{
let mapleader = ","
" }}}
" Line Highlight {{{
set cursorline
" }}}
" Tabs Are Spaces {{{
set expandtab shiftwidth=2 softtabstop=2
" }}}
" Line Numbers {{{
set number relativenumber nu rnu
" }}}
" Word Wrap {{{
set wrap linebreak nolist
" }}}
" Filetype indent detection {{{
filetype indent on
" }}}
" Highlight matching brackets {{{
set showmatch
" }}}
" Searching {{{
set incsearch hlsearch
" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" Code folding {{{
set foldenable
set foldlevelstart=10
" Key binding for code folding
nnoremap <space> za
set foldmethod=indent
" }}}
" Movement {{{
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
" Window Split Movement
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-k> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-j> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-h> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <A-l> :wincmd l<CR>
" }}}
" Mouse Support {{{
set mouse=a
" }}}
" Cursor {{{
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" }}}
" Copy, cut, paste, undo, etc... {{{
vmap <C-c> "+y
vmap <C-x> "+d
imap <C-v> <Esc>pi
imap <C-z> <Esc>ui
imap <C-a> <Esc>ggvG$
" }}}
" Coc {{{
nnoremap <leader> F :call CocAction('format')<CR>
nmap <leader>qf  <Plug>(coc-fix-current)
" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
  \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction

" Coc Snippets
" expand snippet
imap <C-l> <Plug>(coc-snippets-expand)

" select text for visual placeholder
vmap <C-j> <Plug>(coc-snippets-select)

" jump to placeholder
let g:coc_snippet_next = '<c-j>'

let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump
imap <C-j> <Plug>(coc-snippets-expand-jump)

" }}}
" Balloon hover info (Ale) {{{
let g:ale_set_balloons = 1

" }}}

" Plug-ins {{{
call plug#begin('~/.vim/plugged')

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Ale
Plug 'dense-analysis/ale'
" Snazzy colorscheme
Plug 'connorholyday/vim-snazzy'
" Lightline Status bar
Plug 'itchyny/lightline.vim'
" Smooth Scrolling
Plug 'yuttie/comfortable-motion.vim'
" Better Haskell syntax highlighting
Plug 'neovimhaskell/haskell-vim'
" Format on save for haskell
Plug 'alx741/vim-stylishask'
" deal wth elements that surround text like (),[],{},"",'', etc...
Plug 'tpope/vim-surround'
" Perfom async shell commands (Used by other plugins)
Plug 'skywind3000/asyncrun.vim'
" Pandoc-markdown live pdf preview
Plug 'conornewton/vim-pandoc-markdown-preview'
" Text alignment
Plug 'godlygeek/tabular'
" Better markdown highlighting
Plug 'tpope/vim-markdown'
" Zen mode
Plug 'junegunn/goyo.vim'
" For commenting out code
Plug 'scrooloose/nerdcommenter'
" Makes the background truly transparent
Plug 'kjwon15/vim-transparent'
" File Tree View
Plug 'preservim/nerdtree'
" Nerdtree's git integration
Plug 'Xuyuanp/nerdtree-git-plugin'
" Automatically pairs things like (),{},[],"",'', etc...
Plug 'jiangmiao/auto-pairs'
" For integrating vim with git
Plug 'tpope/vim-fugitive'
" Have nice devicons in Nerdtree
Plug 'ryanoasis/vim-devicons'
" Show indent level
Plug 'Yggdroot/indentLine'
" Markdown live preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Syntax for YAML front matter
Plug 'PProvost/vim-markdown-jekyll'
" Julia vim support
Plug 'JuliaEditorSupport/julia-vim'
" View File Outline
Plug 'majutsushi/tagbar'
" Browser integration
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}

call plug#end()

filetype plugin indent on

" }}}

" Lightline {{{
let g:lightline = {
  \ 'colorscheme': 'snazzy',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction','gitbranch' ,'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }
set laststatus=2
set noshowmode
if (&term =~ '^xterm' && &t_Co == 256)
  set t_ut= | set ttyscroll=1
endif
" }}}
" Writing (Pandoc + Markdown) {{{
"   Word count:
nnoremap <F3> :w !detex \| wc -w<CR> 
"let vim_markdown_preview_pandoc=1
let g:md_pdf_viewer="zathura"
let g:md_args="--filter pandoc-citeproc -V --template eisvogel --listings"
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.Rmd setlocal spell
autocmd BufNewfile,BufRead *.Rmd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

" }}}
" Ale {{{
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\  'javascript': ['prettier', 'eslint'],
\  'markdown': ['languagetool','proselint'] 
\}

" }}}
" RASI Syntax {{{
au BufNewFile,BufRead /*.rasi setf css

" }}}
" NERDTREE {{{
map <A-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd BufEnter NERD_tree* :LeadingSpaceDisable

" }}}
" IndentLine {{{
let g:indentLine_char = '│'
let g:indentLine_concealcursor = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" }}}
" Markdown Preview {{{
nmap <C-p> <Plug>MarkdownPreviewToggle

" }}}
" Goyo - Zen Mode {{{
nmap <c-k>z :Goyo<CR>

" }}}
" Colorscheme {{{
colorscheme snazzy

" }}}
" Modelines {{{ 
set modelines=1
" }}}
" Tagbar {{{
nmap <A-t> :TagbarToggle<CR>
" }}}
" vim:foldmethod=marker:foldlevel=0
