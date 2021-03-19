local autocmd = require('utils/autocmd').autocmd
local augroup = require('utils/autocmd').augroup

-- Yank highlight
autocmd('TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}')
