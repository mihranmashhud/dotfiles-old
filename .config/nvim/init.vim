"   ____     _ __        _     
"  /  _/__  (_) /_ _  __(_)_ _ 
" _/ // _ \/ / __/| |/ / /  ' \
"/___/_//_/_/\__(_)___/_/_/_/_/


" Sourced by default
source ~/.config/nvim/vim-plug/plugins.vim
source ~/.config/nvim/general/settings.vim
source ~/.config/nvim/general/functions.vim

if exists('g:started_by_firenvim')
  source ~/.config/nvim/firenvim/settings.vim
  source ~/.config/nvim/keys/mappings.vim
  source ~/.config/nvim/keys/which-key.vim
  source ~/.config/nvim/plug-configs/coc.vim
  source ~/.config/nvim/plug-configs/indentline.vim
  source ~/.config/nvim/plug-configs/nerdcommenter.vim
  source ~/.config/nvim/plug-configs/highlightedyank.vim
  source ~/.config/nvim/plug-configs/writing.vim
  source ~/.config/nvim/plug-configs/nvim-treesitter.vim
  " Theming
  source ~/.config/nvim/themes/syntax.vim
  source ~/.config/nvim/themes/theme.vim
  source ~/.config/nvim/firenvim/lightline.vim
  source ~/.config/nvim/plug-configs/rainbow.vim
elseif exists('g:vscode')
  source ~/.config/nvim/vscode/settings.vim
  source ~/.config/nvim/vscode/mappings.vim
else
  " Keys
  source ~/.config/nvim/keys/mappings.vim
  source ~/.config/nvim/keys/which-key.vim
  " Plugin configs
  source ~/.config/nvim/plug-configs/coc.vim
  source ~/.config/nvim/plug-configs/headerguard.vim
  source ~/.config/nvim/plug-configs/writing.vim
  source ~/.config/nvim/plug-configs/fern.vim
  source ~/.config/nvim/plug-configs/indentline.vim
  source ~/.config/nvim/plug-configs/nerdcommenter.vim
  source ~/.config/nvim/plug-configs/vim-svelte-plugin.vim
  source ~/.config/nvim/plug-configs/highlightedyank.vim
  source ~/.config/nvim/plug-configs/start-screen.vim
  source ~/.config/nvim/plug-configs/gitgutter.vim
  source ~/.config/nvim/plug-configs/rainbow.vim
  source ~/.config/nvim/plug-configs/polyglot.vim
  source ~/.config/nvim/plug-configs/nvim-treesitter.vim
  source ~/.config/nvim/plug-configs/latex-unicoder.vim
  " Theming
  source ~/.config/nvim/themes/syntax.vim
  source ~/.config/nvim/themes/theme.vim
  source ~/.config/nvim/themes/lightline.vim
endif


" Credits - These people are worth checking out
" Christatmachine (github: ChristianChiarulli)
"   - Copied the way he setup up the vimrc
" ThePrimeagen (github: erkrnt)
"   - Really great guy to learn how to speed up in vim
" Luke Smith (github: lukesmithxyz)
"   - Infamous RuneScape character
