echo "Fetch NeoBundle"
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "Create symlink for vimrc"
ln -s ~/dotfiles/vimrc ~/.vimrc

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Create symlink for zshrc"
ln -s ~/dotfiles/zshrc ~/.zshrc

echo "Create symlink for dircolors"
ln -s ~/dotfiles/dircolors ~/.dircolors
