local autocmd = require('utils/autocmd').autocmd
vim.o.shortmess = vim.o.shortmess..'c' -- Avoid short message

autocmd("BufEnter * lua require'completion'.on_attach()")
vim.g.completion_enable_snippet = 'snippets.nvim'
vim.g.completion_matching_smart_case = 1
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'}
vim.g.completion_chain_complete_list = {
   {complete_items = {'lsp', 'snippet', 'tabnine'}},
   {mode = '<C-p>'},
   {mode = '<C-n>'},
}
