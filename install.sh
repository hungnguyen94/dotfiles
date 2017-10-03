#!/usr/bin/env bash 
echo "Fetch vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "Creating symlink for vimrc"
ln -s ~/dotfiles/vimrc ~/.vimrc

if command -v zsh 2>/dev/null; then
  echo "Downloading zplug"
  curl -sL zplug.sh/installer | zsh
fi
echo "Creating symlink for zshrc"
ln -s ~/dotfiles/zshrc ~/.zshrc

echo "Creating symlink for dircolors"
ln -s ~/dotfiles/dircolors ~/.dircolors

echo "Downloading tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Creating symlink for tmux"
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf

echo "Downloading fisherman"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
echo "Creating symlinks for fish"
ln -s ~/dotfiles/fishfile ~/.config/fish/fishfile
ln -s ~/dotfiles/config.fish ~/.config/fish/config.fish
