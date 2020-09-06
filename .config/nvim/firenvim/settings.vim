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

let fc['codewars.com'] = { 'takeover': 'always', 'priority': 1 }
let fc['reddit.com'] = { 'takeover': 'always', 'priority': 1 }
let fc['github.com'] = { 'takeover': 'always', 'priority': 1 }

au BufEnter reddit.com_*.txt set filetype=markdown
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter codewars.com_*.txt set filetype=javascript

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
