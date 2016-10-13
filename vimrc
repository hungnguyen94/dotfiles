if has('vim_starting')
    if &compatible
        set nocompatible               " Be iMproved
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR   = 1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1
endif

if has('gui_running')
    " No toolbar
    set guioptions-=T
    set guioptions-=L
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" Colorschemes
NeoBundle 'flazz/vim-colorschemes'
" Powerline-style bar
NeoBundle 'bling/vim-airline'
" File browser within vim
NeoBundle 'scrooloose/nerdtree'
" Syntax checker
NeoBundle 'scrooloose/syntastic'
" Gruvbox colorscheme
NeoBundle 'morhetz/gruvbox'
" Easily add brackets, parentheses etc
NeoBundle 'tpope/vim-surround'
" Enable repeating with plugin maps
NeoBundle 'tpope/vim-repeat'
" Class outline viewer
NeoBundle 'majutsushi/tagbar'
" Auto completion using tab
NeoBundle 'ervandew/supertab'
" Visually display indent levels
NeoBundle 'nathanaelkane/vim-indent-guides'
" Full path fuzzy finder
NeoBundle 'ctrlpvim/ctrlp.vim'
" Fancy formatting
NeoBundle 'godlygeek/tabular'
" Scala highlighting and more
NeoBundle 'derekwyatt/vim-scala'
" Use sbt within vim
"NeoBundle 'ktvoelker/sbt-vim'
" Simplify motions
NeoBundle 'easymotion/vim-easymotion'
" Git wrapper for vim
NeoBundle 'tpope/vim-fugitive'
" Insert brackets, parenthesis and quotes in pairs
"NeoBundle 'jiangmiao/auto-pairs'
" Color parenthesis levels
NeoBundle 'luochen1990/rainbow'
" Improved code commenting features
NeoBundle 'scrooloose/nerdcommenter'
" Smooth scrolling
"NeoBundle 'yonchu/accelerated-smooth-scroll'
"NeoBundle 'terryma/vim-multiple-cursors'
" Syntax highlighting for pig
"NeoBundle 'motus/pig.vim' 
"NeoBundle 'romainl/flattened'
"NeoBundle 'chriskempson/base16-vim'
"NeoBundle 'altercation/vim-colors-solarized'

NeoBundle 'niklasl/vim-rdf'

" Gradle syntax highlighting for vim
NeoBundle 'tfnico/vim-gradle'
" Ruby vim support
NeoBundle 'vim-ruby/vim-ruby'
" Tmux pane switching awareness
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'tmux-plugins/vim-tmux-focus-events'

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
colorscheme gruvbox
set background=dark
set t_Co=256
set clipboard=unnamedplus
hi Normal ctermbg=None

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
map <Leader>vs :vsplit 
map <Leader>hs :split 
" Remap escape key to jj
inoremap jj <Esc> 
" Move between one displayed line, useful for wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Insert a linebreak at the cursor
nnoremap <Return> i<Return><Esc>

"NeoVim bindings
if has('nvim')
    tnoremap <Esc> <c-\><c-n>
endif

" Options
set number
set relativenumber
set cursorline
set linebreak
set nowrap
" Line wrap (number of cols)
set textwidth=0
set wrapmargin=0
set showmatch
" set spell
" Highlight all matches
set hlsearch
set smartcase
"  Always substitute all matches in a line
set gdefault
set incsearch
" Indent using spaces
set autoindent
set tabstop=4
set expandtab 
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent
" Display pressed keys in normal
set showcmd 
" Automatically refresh files
set autoread 
set complete-=i
set backspace=indent,eol,start

"###### Vim-indent-guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=4

"###### Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_java_checkers=['checkstyle', 'javac']
let g:syntastic_c_checkers=['gcc', 'make']
let g:syntastic_html_checkers=['jshint', 'w3']
let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_matlab_checkers=['mlint']
let g:syntastic_text_checkers=['atdtool']
let g:syntastic_scala_checkers=['scalac', 'fsc']
let g:syntastic_python_checkers=['mypy', 'pycodestyle', 'Pylint', 'python']
map <Leader>S :SyntasticCheck<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
" Show buffers on top
let g:airline#extensions#tabline#enabled = 1

"####### YouCompleteMe
let g:ycm_python_binary_path = 'python'

"##### nerdtree
"autocmd vimenter * NERDTree
map <Leader>N :NERDTreeToggle<CR>

" Tagbar
map <Leader>t :TagbarToggle<CR>

" Tabularize
nmap <Leader>]: :Tabularize /:\zs<CR>
vmap <Leader>]: :Tabularize /:\zs<CR>
nmap <Leader>] :Tabularize /
vmap <Leader>] :Tabularize /

" EasyMotion
map ` <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)

" Rainbow Parenthesis
let g:rainbow_active=1

" Eclim
let g:SuperTabDefaultCompletionType = 'context'
"let g:EclimCompletionMethod = 'omnifunc'
"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" Vim ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
autocmd FileType ruby compiler ruby
