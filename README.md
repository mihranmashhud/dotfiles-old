### Warning!
I don't recommend using the script below as it **DOES NOT PROPERLY BACKUP** the dotfiles on your system!

# My dotfiles

### Here is the quick script to install them
```
git clone --recursive --bare https://github.com/mihranmashhud/dotfiles.git $HOME/dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME $@
}
mkdir -p dotfiles-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} dotfiles-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
#### Via Curl
```
curl -Lks https://gist.github.com/mihranmashhud/e5ac2fef721b560addaaaf167c2b6362 | /bin/bash
```

### Or Step By Step:
Clone the repo:
```
git clone --recursive --bare https://github.com/mihranmashhud/dotfiles.git $HOME/dotfiles
```
Define the config alias in current shell scope:
```
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

```
Backup old configs:
```
mkdir -p dotfiles-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} dotfiles-backup/{}
```
Now checkout:
```
config checkout
```
Untrack files that aren't part of dotfiles:
```
config config --local status.showUntrackedFiles no
```

## Notes:
+ Don't forget to do PlugInstall when in vim to get them plugins
+ The plugin vim-haskell requires the Haskell IDE Engine so go install that
```
sudo apt install libicu-dev libtinfo-dev libgmp-dev haskell-stack
git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine
stack upgrade
stack install.hs build
```
