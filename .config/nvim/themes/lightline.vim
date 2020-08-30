" Lightline
let g:lightline = {
  \ 'colorscheme': 'snazzy',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'cocstatus', 'currentfunction','gitbranch' ,'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'cocstatus': 'coc#status',
  \   'gitbranch': 'fugitive#head'
  \ },
  \ }

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
