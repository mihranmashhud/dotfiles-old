" Auto reload when entering fern buffer

function! FernInit() abort
  augroup FernGroupLocal
    autocmd! * <buffer>
    autocmd BufEnter <buffer> silent execute "normal \<Plug>(fern-action-reload)"
    autocmd BufEnter <buffer> set laststatus=0
  augroup END
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

autocmd  FileType fern set laststatus=0
  \| autocmd BufLeave <buffer> set laststatus=2

" Use NerdFont for rendering
let g:fern#renderer = "nerdfont"

