call plug#begin('~/.vim/plugged')

Plug 'alx741/vim-stylishask'
Plug 'arakashic/chromatica.nvim'
Plug 'connorholyday/vim-snazzy'
Plug 'conornewton/vim-pandoc-markdown-preview'
Plug 'dense-analysis/ale'
Plug 'evanleck/vim-svelte'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kjwon15/vim-transparent'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'majutsushi/tagbar'
Plug 'mattly/vim-markdown-enhancements'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'PProvost/vim-markdown-jekyll'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'vue', 'yaml', 'html'] }
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'

call plug#end()
