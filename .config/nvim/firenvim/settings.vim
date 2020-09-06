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
