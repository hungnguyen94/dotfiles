echo "Fetch NeoBundle"
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
echo "Create symlink"
ln -s ~/dotfiles/vimrc ~/.vimrc
