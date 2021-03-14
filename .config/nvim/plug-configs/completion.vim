autocmd BufEnter * lua require'completion'.on_attach()
let g:completion_enable_snippet = 'snippets.nvim'
