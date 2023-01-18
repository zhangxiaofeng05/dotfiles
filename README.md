## nvim
```
brew install node
brew install neovim
npm install -g neovim

python3 -m pip install --user --upgrade pynvim
```
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

## recommand
 - [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
 - [powerlevel10k](https://github.com/romkatv/powerlevel10k)

## git
### ln
```
ln -s ~/openSource/dotfiles/.gitconfig ~/.gitconfig

(optional-lazygit)
ln -s ~/openSource/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
```

## tmux
### ln
```
ln -s ~/openSource/dotfiles/.tmux.conf ~/.tmux.conf
```

## lepton
### ln
```
(optional)
# https://github.com/hackjutsu/Lepton/wiki/FAQ
ln -s ~/openSource/dotfiles/.leptonrc ~/.leptonrc
```
