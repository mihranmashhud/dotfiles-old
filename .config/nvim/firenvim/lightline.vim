" Lightline
let g:lightline = {
      \   'colorscheme': 'snazzy',
      \   'active': {
      \    'left': [ [ 'mode', 'paste' ] ],
      \    'right': [ [ 'lineinfo' ],
      \               [ 'filetype' ] ],
      \   }
      \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
