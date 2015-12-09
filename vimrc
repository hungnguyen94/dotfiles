if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'tpope/vim-fugitive'
"NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'ervandew/supertab'
NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'chriskempson/base16-vim'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Colorscheme
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
map <Leader>vs :vsplit 
map <Leader>hs :split 

syntax enable
set number
set cursorline
set linebreak
set wrap
set expandtab " Indent using spaces
set tabstop=4
set shiftwidth=4

if has('gui_running')
	set guifont=Inconsolata\ for\ Powerline\ Medium\ 10
	set go-=T
	set go-=m
	set background=light
endif

"###### Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_c_checkers = ['gcc', 'make']
let g:syntastic_html_checkers = ['jshint', 'w3']
let g:syntastic_sql_checkers = ['sqlint']
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_matlab_checkers = ['mlint']
let g:syntastic_text_checkers = ['atdtool']
map <Leader>S :SyntasticCheck<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='base16'

"##### nerdtree
"autocmd vimenter * NERDTree
map <Leader>N :NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>
map <Leader>t :TagbarToggle<CR>
