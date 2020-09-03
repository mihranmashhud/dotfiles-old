" Lightline
let g:lightline = {
      \ 'colorscheme': 'snazzy',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction','gitbranch' ,'readonly', 'filename'] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
