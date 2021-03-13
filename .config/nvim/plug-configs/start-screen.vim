let g:startify_session_dir = '~/.local/share/nvim/session'

let g:startify_lists = [
      \ { 'type': 'files', 'header': ['Recent'] },
      \ { 'type': 'dir', 'header': ['CWD: '. getcwd()] },
      \ { 'type': 'sessions', 'header': ['Sessions'] },
      \ { 'type': 'bookmarks', 'header': ['Bookmarks'] }
      \ ]

let g:startify_bookmarks = [
      \ { 'i': '~/.config/nvim/init.vim' },
      \ { 'b': '~/.config/bspwm/bspwmrc' },
      \ { 'z': '~/.config/zsh/.zshrc' },
      \ { 'p': '~/.config/polybar/config' },
      \ { 's': '~/.config/sxhkd/sxhkdrc' }
      \ ]

let g:startify_custom_header = [
      \ '    _   _                 _          ',
      \ '   / | / /__  ____ _   __(_)___ ___  ',
      \ '  /  |/ / _ \/ __ \ | / / / __ `__ \ ',
      \ ' / /|  /  __/ /_/ / |/ / / / / / / / ',
      \ '/_/ |_/\___/\____/|___/_/_/ /_/ /_/  '
      \ ]

let g:startify_session_persistence = 1

let g:startify_change_to_vcs_root = 1

let g:startify_enable_special = 0
