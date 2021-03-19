local autocmd_utils = require('utils/autocmd')
local autocmd = autocmd_utils.autocmd
local augroup = autocmd_utils.augroup

vim.g.md_pdf_viewer = 'zathura'
vim.g.md_args='--filter pandoc-citeproc -V --listings'

autocmd('BufNewfile,BufRead *.Rmd set filetype=markdown')
autocmd('BufNewfile,BufRead *.md set filetype=markdown')

augroup({
   'Filetype markdown,mkd,pandoc call lexical#init() | call pencil#init() | call litecorrect#init()',
   'Filetype textile call lexical#init() | call pencil#init() | call litecorrect#init()',
}, 'lexical')

vim.g['lexical#spelllang'] = {'en_us', 'en_ca'}

-- Pencil defaults
vim.g['pencil#conceallevel'] = 1
vim.g['pencil#textwidth'] = 80
