echo "Fetch NeoBundle"
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "Create symlink for vimrc"
ln -s ~/dotfiles/vimrc ~/.vimrc

echo "Downloading zplug"
curl -sL zplug.sh/installer | zsh
echo "Create symlink for zshrc"
ln -s ~/dotfiles/zshrc ~/.zshrc

echo "Create symlink for dircolors"
ln -s ~/dotfiles/dircolors ~/.dircolors

echo "Downloading tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Create symlink for tmux"
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
