## nvim
### clone
```
mkdir ~/openSource && cd ~/openSource
git clone https://github.com/zhangxiaofeng05/dotfiles.git
```
### [vim-plug](https://github.com/junegunn/vim-plug#unix-linux)
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
### ln
```
ln -s ~/openSource/dotfiles/nvim/ ~/.config/nvim
```
## git
### ln
```
ln -s ~/openSource/dotfiles/.gitconfig ~/.gitconfig
```
