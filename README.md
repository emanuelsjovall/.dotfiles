# Dotfiles 

clone repo into home folder then run gnu stow inside this repo like such
Make sure that the ~/.config folder exists before running
```
stow <thing to stow ex. stow tmux>
```
or to stow every file
```
stow */
```

## Other stuff
To install tmux plugins run `prefix + I` in tmux (prefix is `ctrl + b`)

## zsh syntax highlight
```shell
sudo apt install zsh-syntax-highlighting
```

Do this inside of the .config folder
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```
