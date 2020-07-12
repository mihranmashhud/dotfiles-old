set iskeyword+=- " Dash seperated words are a text object

if !exists('g:vscode')
  syntax enable                            " Syntax on of course
  set hidden                               " Abondoning a buffer does not unload it
  set encoding=utf-8                       " Use UTF-8 encoding
  set fileencoding=utf-8                   " UTF-8 encoding written to file
  set pumheight=10                         " Set PUM to 10
  set mouse=a                              " Look I know I shouldn't use it but come on!
  set splitbelow                           " Would be pretty annoying if it kept opening up top
  set splitright                           " Also annoying if it opened left
  set termguicolors                        " Give me all them term colors
  set conceallevel=0                       " I want to see it all
  set expandtab shiftwidth=2 softtabstop=2 " Tabs are 2 spaces
  set smartindent autoindent               " Indent smart, indent always
  set laststatus=2                         " Always show me my beautiful statusline
  set nu rnu                               " I like my line numbers visible and relative
  set cursorline                           " That line is important, the one the cursor is on
  set background=dark                      " Keep it dark (Though I go transparent)
  set whichwrap+=<,>,h,l,[,]               " Wrap that cursor around
  set nowrap                               " No wrapping Please
  set noshowmode                           " Lightline can handle that
  set noruler                              " Lightline can also handle that
  set nobackup nowritebackup               " Coc recommends it so I listen
  set shortmess+=c                         " Those messages get pretty annoying
  set updatetime=300                       " Faster completion
  set timeoutlen=100                       " Faster timeout (defaults to 1000)
  set clipboard=unnamedplus                " Now I can use the clipboard
  set incsearch hlsearch                   " Highlight matches as I type my search
  set undodir=~/.local/share/nvim/undodir  " For time travel purposes
  set undofile                             " For time travel purposes
  set virtualedit=onemore                  " It feels better
  set modelines=1                          " For custom commands on a given buffer
  filetype plugin on
endif

