call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'alx741/vim-stylishask'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'drmikehenry/vim-headerguard'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'frazrepo/vim-rainbow'
Plug 'ghifarit53/tokyonight-vim'
Plug 'gi1242/vim-tex-syntax'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joom/latex-unicoder.vim'
Plug 'JuliaEditorSupport/julia-vim'
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
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
Plug 'machakann/vim-highlightedyank'
Plug 'majutsushi/tagbar'
Plug 'mattly/vim-markdown-enhancements'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'PProvost/vim-markdown-jekyll'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
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
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/Vimball'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()
