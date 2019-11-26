# My dotfiles

### Here is the quick script to install them
```
git clone --bare https://github.com/mihranmashhud/dotfiles.git $HOME/dotfiles
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

### Or Step By Step:
Clone the repo:
```
git clone --bare https://github.com/mihranmashhud/dotfiles.git $HOME/dotfiles
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
