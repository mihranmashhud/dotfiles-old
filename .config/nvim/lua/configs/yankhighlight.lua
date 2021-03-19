local autocmd = require'utils.autocmd'.autocmd

autocmd('TextYankPost * silent! lua vim.highlight.on_yank()')
