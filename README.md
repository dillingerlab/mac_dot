Mostly assembled from https://github.com/jessfraz/dotfiles
use zsh
install homebrew
install iterm2
## finish python
source ~/.zshrc
pyenv install 3.8
pyenv install 3.10
pyenv global 3.8
TODO:
Find way to append following to `.gitconfig`:
```
[alias]
last = log -1 HEAD
re2 = rebase -i HEAD~2
```
https://stackoverflow.com/questions/20146972/is-there-a-way-to-make-alt-f-and-alt-b-jump-word-forward-and-backward-instead-of
