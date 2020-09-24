call plug#begin('~/.local/share/nvim/plugged')

Plug 'JuliaEditorSupport/julia-vim'
Plug 'PProvost/vim-markdown-jekyll'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alx741/vim-stylishask'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'arakashic/chromatica.nvim'
Plug 'connorholyday/vim-snazzy'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'drmikehenry/vim-headerguard'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'frazrepo/vim-rainbow'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kjwon15/vim-transparent'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'liuchengxu/vista.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mattly/vim-markdown-enhancements'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'vim-scripts/BufOnly.vim'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()
