call plug#begin('~/.local/share/nvim/plugged')

" LSP / IDE features
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-telescope/telescope-fzy-native.nvim'             " Native fuzzy search
Plug 'nvim-telescope/telescope.nvim'                        " Telescope
Plug 'nvim-lua/popup.nvim'                                  " For Telescope
Plug 'nvim-lua/plenary.nvim'                                " For Telescope
Plug 'nvim-lua/completion-nvim'                             " Completion using native LSP
Plug 'norcalli/snippets.nvim'                               " Snippets to use in nvim
Plug 'neovim/nvim-lspconfig'                                " Neovim native LSP
"Plug 'neoclide/coc.nvim', {'branch': 'release'}             " LSP plugin ~ Replace with native lsp
Plug 'liuchengxu/vista.vim'                                 " Tag viewer ~ LSP plugin may be available
Plug 'lambdalisue/fern.vim'                                 " Fern file explorer
Plug 'lambdalisue/fern-git-status.vim'                      " Git status flags in fern
Plug 'junegunn/fzf.vim'                                     " FZF ~ Replace with Telescope
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }         " FZF ~ Replace with Telescope
Plug 'glepnir/lspsaga.nvim'                                 " LSP UI
Plug 'steelsojka/completion-buffers'                        " Buffer completion source

" Language specific
Plug 'vim-pandoc/vim-pandoc'        " Pandoc integration
Plug 'JuliaEditorSupport/julia-vim' " Julia support in vim
Plug 'alx741/vim-stylishask'        " Prettify Haskell ~ LSP may replace

" Git
Plug 'tpope/vim-fugitive'     " Git integration ~ Telescope may replace?
Plug 'airblade/vim-gitgutter' " Git changes in gutter

" Syntax
Plug 'vim-pandoc/vim-pandoc-syntax'            " Pandoc syntax ~ Remove when treesitter grammar exists
Plug 'tpope/vim-markdown'                      " Markdown syntax ~ Likely Remove
Plug 'sheerun/vim-polyglot'                    " Multilang syntax support
Plug 'lervag/vimtex'                           " Latex syntax - used by pandoc syntax
Plug 'evanleck/vim-svelte', {'branch': 'main'} " svelte plugin
Plug 'PProvost/vim-markdown-jekyll'            " YAML front matter highlighting

" Prose editing
Plug 'reedes/vim-pencil'          " Writing mode for vim
Plug 'reedes/vim-litecorrect'     " Autocorrect common spelling errors
Plug 'reedes/vim-lexical'         " Spell check additions + Thesaurus/dictionary completion
Plug 'joom/latex-unicoder.vim'    " Convert latex command to unicode
Plug 'dhruvasagar/vim-table-mode' " Mode for creating and editing vim tables

" Shortcuts
Plug 'vim-scripts/BufOnly.vim'     " Remove all buffers except current focused
Plug 'tpope/vim-surround'          " Edit surrounding text
Plug 'tpope/vim-eunuch'            " Sugar on top of shell commands
Plug 'drmikehenry/vim-headerguard' " Add header guard.

" QOL
Plug 'yuttie/comfortable-motion.vim'                                 " Smooth scrolling
Plug 'preservim/nerdcommenter'                                       " Comment out text
Plug 'norcalli/nvim-colorizer.lua'                                   " Fast color preview
Plug 'mhinz/vim-startify'                                            " Start screen
Plug 'machakann/vim-highlightedyank'                                 " Highlight yank ~ Replace! check :h lua-highlight
Plug 'liuchengxu/vim-which-key'                                      " Whichkey for vim
Plug 'junegunn/goyo.vim'                                             " Zen mode
Plug 'jiangmiao/auto-pairs'                                          " Auto pair brackets
Plug 'godlygeek/tabular'                                             " Align text easily
Plug 'frazrepo/vim-rainbow'                                          " Rainbow brackets ~ Does not seem to work

" Look & Feel
Plug 'ryanoasis/vim-devicons'                                 " Devicons in vim
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'} " Indent lines
Plug 'lambdalisue/nerdfont.vim'                               " Nerdfont handler for vim
Plug 'lambdalisue/fern-renderer-nerdfont.vim'                 " Fern nerdfont renderer
Plug 'kjwon15/vim-transparent'                                " Enable terminal transparency. ~ Remove if not needed
Plug 'itchyny/lightline.vim'                                  " Lightweight status bar
Plug 'ghifarit53/tokyonight-vim'                              " Tokyonight Theme

" Tools
Plug 'voldikss/vim-floaterm'                                              " Floating terminal
Plug 'vim-scripts/Vimball'                                                " Make and unzip vimballs
Plug 'skywind3000/asyncrun.vim'                                           " Run shell commands in async
Plug 'metakirby5/codi.vim'                                                " Code playground
Plug 'mbbill/undotree'                                                    " View undo tree
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Preview markdown while it is written ~ Replace with pandoc

" Browser
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}                  " Send text between browser and nvim.
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } " Browser nvim integration

" Workarounds
Plug 'antoinemadec/FixCursorHold.nvim' " Fix Cursor Hold Issue (https://github.com/neovim/neovim/issues/12587)

call plug#end()
