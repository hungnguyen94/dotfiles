if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

"if has('nvim')
"  let $NVIM_TUI_ENABLE_TRUE_COLOR   = 1
"  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
"endif


" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
"NeoBundle 'tpope/vim-fugitive'
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
NeoBundle 'chriskempson/base16-vim'
" Syntax highlighting for pig
NeoBundle 'motus/pig.vim' 
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'romainl/flattened'
NeoBundle 'godlygeek/tabular'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Colorscheme
syntax on
hi clear
colorscheme flattened_dark
set background=dark
"let g:solarized_termtrans=1
hi Normal ctermbg=none
hi NonText ctermbg=none
set t_Co=256

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
map <Leader>vs :vsplit 
map <Leader>hs :split 
" Remap escape key to hj
inoremap hj <Esc> 
vnoremap hj <Esc>
" Move between one displayed line, useful for wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" Options
set number
set relativenumber
set cursorline
set linebreak
set wrap
"  Line wrap (number of cols)
set textwidth=100
set showmatch
" set spell
" Highlight all matches
set hlsearch
set smartcase
"  Always substitute all matches in a line
set gdefault
set incsearch
" Indent using spaces
set expandtab 
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
" Display pressed keys in normal
set showcmd 
" Automatically refresh files
set autoread 
set complete-=i
set backspace=indent,eol,start

"###### Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_java_checkers=['checkstyle', 'javac']
let g:syntastic_c_checkers=['gcc', 'make']
let g:syntastic_html_checkers=['jshint', 'w3']
let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_matlab_checkers=['mlint']
let g:syntastic_text_checkers=['atdtool']
map <Leader>S :SyntasticCheck<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='papercolor'
" Show buffers on top
let g:airline#extensions#tabline#enabled = 1

"##### nerdtree
"autocmd vimenter * NERDTree
map <Leader>N :NERDTreeToggle<CR>

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Tabularize
nmap <Leader>]= :Tabularize /=<CR>
vmap <Leader>]= :Tabularize /=<CR>
nmap <Leader>]: :Tabularize /:\zs<CR>
vmap <Leader>]: :Tabularize /:\zs<CR>
nmap <Leader>] :Tabularize /
vmap <Leader>] :Tabularize /
