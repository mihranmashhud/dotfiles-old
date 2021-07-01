local autocmd_utils = require('utils/autocmd')
local autocmd = autocmd_utils.autocmd
local nnoremap = require'utils.map'.nnoremap

vim.g.md_pdf_viewer = 'zathura'
vim.g.md_args='--filter pandoc-citeproc -V --listings'

autocmd('BufNewfile,BufRead *.Rmd set filetype=markdown')
autocmd('BufNewfile,BufRead *.md set filetype=markdown')

-- Init writing plugins
vim.fn['pencil#init']()
vim.fn['litecorrect#init']()
vim.fn['lexical#init']()

-- Defaults
vim.g['pencil#conceallevel'] = 1
vim.g['pencil#textwidth'] = 80
vim.g['lexical#spelllang'] = {'en_us', 'en_ca'}

nnoremap('<leader>ap', ':PencilToggle', { silent = true }, 'toggle pencil')
