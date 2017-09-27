echo "Fetch vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
