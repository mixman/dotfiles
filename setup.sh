ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zprofile ~/.zprofile
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig

mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
rm -rf ~/.config/nvim/colors
ln -s ~/dotfiles/.vim/colors ~/.config/nvim/colors
rm -rf ~/.config/nvim/autoload
ln -s ~/dotfiles/.vim/autoload ~/.config/nvim/autoload
ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

mkdir -p ~/.hammerspoon
ln -sf ~/dotfiles/.hammerspoon/init.lua ~/.hammerspoon/init.lua

# non breaking space to normal space
mkdir -p ~/Library/KeyBindings/
cp DefaultKeyBinding.dict ~/Library/KeyBindings/
