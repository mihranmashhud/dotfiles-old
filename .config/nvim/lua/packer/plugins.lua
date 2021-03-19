local autocmd = require('utils/autocmd').autocmd
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

autocmd('BufWritePost plugins.lua PackerCompile')

execute 'packadd packer.nvim'

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- LSP / IDE features
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }                                                -- Treesitter
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }                                                -- Telescope
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-lua/completion-nvim'                                                -- Completion using native LSP
  use 'nvim-telescope/telescope-snippets.nvim'                                                -- Telescope snippets
  use 'norcalli/snippets.nvim'                     -- Snippets to use in nvim
  use 'neovim/nvim-lspconfig'                      -- Neovim native LSP
  use 'liuchengxu/vista.vim'                       -- Tag viewer ~ LSP plugin may be available
  use 'glepnir/lspsaga.nvim'                       -- LSP UI
  use {
    'steelsojka/completion-buffers',
    requires = {{'nvim-lua/completion-nvim'}}
  }              -- Buffer completion source
  use {
    'aca/completion-tabnine',
    run = {'./install.sh'},
    requires = {{'nvim-lua/completion-nvim'}}
  }              -- Tabnine completion source
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {{'kyazdani42/nvim-web-devicons'}}
  }

  -- Language specific
  use {'vim-pandoc/vim-pandoc', ft = {'pandoc'}, opt = true}        -- Pandoc integration
  use {'JuliaEditorSupport/julia-vim', ft = {'julia'}, opt = true} -- Julia support in vim
  use 'alx741/vim-stylishask'        -- Prettify Haskell ~ LSP may replace

  -- Git
  use 'tpope/vim-fugitive'     -- Git integration ~ Telescope may replace?
  use 'airblade/vim-gitgutter' -- Git changes in gutter

  -- Syntax
  use {'vim-pandoc/vim-pandoc-syntax', ft = {'pandoc'}}         -- Pandoc syntax ~ Remove when treesitter grammar exists
  use 'sheerun/vim-polyglot'                                    -- Multilang syntax support
  use {'lervag/vimtex', ft = {'tex', 'latex'}}                  -- Latex syntax - used by pandoc syntax
  use {'evanleck/vim-svelte', branch = 'main', ft = {'svelte'}} -- svelte plugin
  use {
    'PProvost/vim-markdown-jekyll',
    ft = {'markdown', 'pandoc', 'rmarkdown'}
  }                                                             -- YAML front matter highlighting

  -- Prose editing
  --local prose_fts = {'markdown', 'latex', 'pandoc', 'rmarkdown'}
  use {
    'reedes/vim-pencil',
    --ft = prose_fts
  }                                -- Writing mode for vim
  use {
    'reedes/vim-litecorrect',
    --ft = prose_fts
  }                                -- Autocorrect common spelling errors
  use {
    'reedes/vim-lexical',
    --ft = prose_fts
  }-- Spell check additions + Thesaurus/dictionary completion
  use {
    'joom/latex-unicoder.vim',
    --ft = prose_fts
  }-- Convert latex command to unicode
  use {
    'dhruvasagar/vim-table-mode',
    --ft = prose_fts
  }-- Mode for creating and editing tables

  -- Shortcuts
  use 'vim-scripts/BufOnly.vim'     -- Remove all buffers except current focused
  use 'tpope/vim-surround'          -- Edit surrounding text
  use 'tpope/vim-eunuch'            -- Sugar on top of shell commands
  use {
    'drmikehenry/vim-headerguard',
    ft = { 'cpp', 'c' },
  }-- Add header guard.

  -- QOL
  use 'yuttie/comfortable-motion.vim' -- Smooth scrolling
  use 'preservim/nerdcommenter'       -- Comment out text
  use 'norcalli/nvim-colorizer.lua'   -- Fast color preview
  use 'glepnir/dashboard-nvim'        -- Start screen
  use {
    'liuchengxu/vim-which-key',
  }                                   -- Whichkey for vim
  use 'junegunn/goyo.vim'             -- Zen mode
  use 'jiangmiao/auto-pairs'          -- Auto pair brackets
  use 'godlygeek/tabular'             -- Align text easily

  -- Look & Feel
  use {'lukas-reineke/indent-blankline.nvim', branch='lua'} -- Indent lines
  use 'lambdalisue/nerdfont.vim'                            -- Nerdfont handler for vim
  use 'kjwon15/vim-transparent'                             -- Enable terminal transparency. ~ Remove if not needed
  use 'ghifarit53/tokyonight-vim'                           -- Tokyonight Theme
  use {
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Tools
  use 'vim-scripts/Vimball'                                                -- Make and unzip vimballs
  use 'skywind3000/asyncrun.vim'                                           -- Run shell commands in async
  use 'metakirby5/codi.vim'                                                -- Code playground
  use 'mbbill/undotree'                                                    -- View undo tree
  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'rmarkdown'},
    run = function ()
      vim.fn['mkdp#util#install']()
    end
  } -- Preview markdown while it is written ~ Replace with pandoc

  -- Browser
  use {'raghur/vim-ghost', run = ':GhostInstall'}                  -- Send text between browser and nvim.
  use {
    'glacambre/firenvim',
    run = function ()
      vim.fn['firenvim#install'](0)
    end,
    opt = true,
  } -- Browser integration

  -- Workarounds
  use 'antoinemadec/FixCursorHold.nvim' -- Fix Cursor Hold Issue (https://github.com/neovim/neovim/issues/12587)
end)
