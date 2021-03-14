" Leader
let mapleader=' '
" let localleader=','
nnoremap <Space> <Nop>

" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
set timeoutlen=500


" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0
  \| autocmd BufLeave <buffer> set laststatus=2


" Single mappings
nmap <Leader>/ <plug>NERDCommenterToggle
vmap <Leader>/ <plug>NERDCommenterToggle
let g:which_key_map['/'] = 'comment'
let g:which_key_map[';'] = [ ':Commands'    , 'commands' ]
let g:which_key_map['='] = [ '<C-W>='       , 'balance windows' ]
let g:which_key_map[','] = [ 'Startify'     , 'start screen' ]
let g:which_key_map['c'] = [ ':Codi!!'      , 'virtual repl']
let g:which_key_map['f'] = [ ':Files'       , 'search files' ]
let g:which_key_map['r'] = [ ':RnvimrToggle', 'ranger' ]
let g:which_key_map['S'] = [ ':SSave'       , 'save session' ]
let g:which_key_map['T'] = [ ':Rg'          , 'search text' ]
let g:which_key_map['z'] = [ 'Goyo'         , 'zen mode' ]
nnoremap <silent> <leader>h :noh<CR>
let g:which_key_map['h'] = 'remove search highlight'
let g:which_key_map[' '] = [ ''                           , 'exit' ]

" Group mappings

" a is for actions
let g:which_key_map.a = {
      \ 'name' : '+actions' ,
      \ 'c' : [':ColorizerToggle'                 , 'colorizer']              ,
      \ 'e' : [':Fern . -drawer -reveal=% -toggle', 'explorer']               ,
      \ 't' : [':FloatermToggle'                  , 'terminal']               ,
      \ 'u' : [':UndotreeToggle'                  , 'undo tree']              ,
      \ 'v' : [':TagbarToggle'                    , 'tag viewer']
      \ }
let g:which_key_map['a']['l'] = 'LaTeX->Unicode'
nnoremap <silent> <leader>al :call unicoder#start(0)<CR>
vnoremap <silent> <leader>al :<C-u>call unicoder#selection()<CR>

autocmd FileType markdown,mkd,pandoc,textile,latex let g:which_key_map.a['p'] = ['TogglePencil', 'Pencil Toggle']

" l is for language server protocol
let g:which_key_map.l = {
      \ 'name': '+lsp',
      \ 'a': 'code actions',
      \ 'r': 'buf rename',
      \ 'e': 'show diagnostics',
      \ 'F': 'format'
      \ }
nnoremap <silent> <leader>la :Lspsaga code_action<CR>
vnoremap <silent> <leader>la :<C-U>Lspsaga range_code_action<CR>

" w is for workspace
let g:which_key_map['w'] = {
      \ 'name': '+workspace',
      \ 'a': 'add workplace folder',
      \ 'r': 'remove workplace folder',
      \ 'l': 'list workplace folders'
      \ }

nnoremap <silent> <leader>wa <Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <leader>wr <Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <leader>wl <Cmd>lua vim.lsp.buf.list_workspace_folders()<CR>

" TODO: Replace with telescope
" s is for search
let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ 'f' : ['<cmd>Telescope find_files'                 , 'files'],
      \ }
      "\ '/' : [':History/'              , 'history'],
      "\ ';' : [':Commands'              , 'commands'],
      "\ 'a' : [':Ag'                    , 'text Ag'],
      "\ 'b' : [':BLines'                , 'current buffer'],
      "\ 'B' : [':Buffers'               , 'open buffers'],
      "\ 'c' : [':Commits'               , 'commits'],
      "\ 'C' : [':BCommits'              , 'buffer commits'],
      "\ 'g' : [':GFiles'                , 'git files'],
      "\ 'G' : [':GFiles?'               , 'modified git files'],
      "\ 'h' : [':History'               , 'file history'],
      "\ 'H' : [':History:'              , 'command history'],
      "\ 'l' : [':Lines'                 , 'lines'] ,
      "\ 'm' : [':Marks'                 , 'marks'] ,
      "\ 'M' : [':Maps'                  , 'normal maps'] ,
      "\ 'p' : [':Helptags'              , 'help tags'] ,
      "\ 'P' : [':Tags'                  , 'project tags'],
      "\ 's' : [':CocList snippets'      , 'snippets'],
      "\ 'S' : [':Colors'                , 'color schemes'],
      "\ 't' : [':Rg'                    , 'text Rg'],
      "\ 'T' : [':BTags'                 , 'buffer tags'],
      "\ 'w' : [':Windows'               , 'search windows'],
      "\ 'y' : [':Filetypes'             , 'file types'],

" g is for git
let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':Git add %'                        , 'add current'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }

" t is for terminal
let g:which_key_map.t = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'n' : [':FloatermNew node'                              , 'node'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ }

" Register which key map
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
