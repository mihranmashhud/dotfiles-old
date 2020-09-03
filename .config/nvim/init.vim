"   ____     _ __        _     
"  /  _/__  (_) /_ _  __(_)_ _ 
" _/ // _ \/ / __/| |/ / /  ' \
"/___/_//_/_/\__(_)___/_/_/_/_/


" Sourced by default
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/which-key.vim

if exists('g:vscode')
else
  " Plugin configs
  source $HOME/.config/nvim/plug-configs/coc.vim
  source $HOME/.config/nvim/plug-configs/headerguard.vim
  source $HOME/.config/nvim/plug-configs/writing.vim
  source $HOME/.config/nvim/plug-configs/nerdtree.vim
  source $HOME/.config/nvim/plug-configs/indentline.vim
  source $HOME/.config/nvim/plug-configs/netrw.vim
  source $HOME/.config/nvim/plug-configs/vim-svelte-plugin.vim
  source $HOME/.config/nvim/plug-configs/highlightedyank.vim
  source $HOME/.config/nvim/plug-configs/start-screen.vim
  source $HOME/.config/nvim/plug-configs/gitgutter.vim
  " Theming
  source $HOME/.config/nvim/themes/syntax.vim
  source $HOME/.config/nvim/themes/snazzy.vim
  source $HOME/.config/nvim/themes/lightline.vim
  source $HOME/.config/nvim/themes/overrides.vim
endif


" Credits - These people are worth checking out
" Christatmachine (github: ChristianChiarulli)
"   - Copied the way he setup up the vimrc
" ThePrimeagen (github: erkrnt)
"   - Really great guy to learn how to speed up in vim
" Luke Smith (github: lukesmithxyz)
"   - Infamous RuneScape character
