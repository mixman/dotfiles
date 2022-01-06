ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile

mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.vim ~/.config/nvim/init.vim
rm -rf ~/.config/nvim/colors
ln -s ~/dotfiles/.vim/colors ~/.config/nvim/colors
rm -rf ~/.config/nvim/autoload
ln -s ~/dotfiles/.vim/autoload ~/.config/nvim/autoload
ln -s ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

mkdir -p ~/.hammerspoon
ln -sf ~/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua

