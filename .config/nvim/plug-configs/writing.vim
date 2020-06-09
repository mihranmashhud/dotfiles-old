" Writing (Pandoc + Markdown)
"   Word count:
nnoremap <F3> :w !detex \| wc -w<CR> 
"let vim_markdown_preview_pandoc=1
let g:md_pdf_viewer="zathura"
let g:md_args="--filter pandoc-citeproc -V --template eisvogel --listings"
"autocmd BufRead,BufNewFile *.md setlocal spell
"autocmd BufRead,BufNewFile *.Rmd setlocal spell
autocmd BufNewfile,BufRead *.Rmd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'
" actually highlight the region we defined as "math"
hi link math Statement

augroup lexical
 autocmd!
 autocmd Filetype markdown,mkd call lexical#init() | call pencil#init() | call litecorrect#init()
 autocmd Filetype textile call lexical#init() | call pencil#init() | call litecorrect#init()
 autocmd Filetype text call lexical#init({ 'spell', 0 }) | call pencil#init() | call litecorrect#init()
augroup END
let g:lexical#spelllang = ['en_us','en_ca',]
