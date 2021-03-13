set guifont=FuraCode\ Nerd\ Font:h11

let g:firenvim_config = {
      \ 'globalSettings': {
      \   'alt': 'all',
      \ },
      \ 'localSettings': {
      \   '.*': {
      \     'cmdline': 'neovim',
      \     'priority': 0,
      \     'takeover': 'never',
      \     'selector': 'textarea:not([readonly]), div[role="textbox"]'
      \   },
      \ }
      \ }

let fc = g:firenvim_config['localSettings']

au BufEnter reddit.com_*.txt set filetype=markdown
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter codewars.com_*.txt set filetype=javascript
au BufEnter localhost:1234*.txt set filetype=julia

let g:dont_write = v:false
function! My_Write(timer) abort
      let g:dont_write = v:false
      silent write
endfunction

function! Delay_My_Write() abort
      if g:dont_write
            return
      end
      let g:dont_write = v:true
      call timer_start(10000, 'My_Write')
endfunction

au TextChanged * ++nested call Delay_My_Write()
au TextChangedI * ++nested call Delay_My_Write()
