if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
  set guicursor=
endif

if has('gui_running')
  " No toolbar
  set guioptions-=T
  set guioptions-=L
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

" Colorschemes
Plug 'flazz/vim-colorschemes'
" Powerline-style bar
Plug 'bling/vim-airline'
" Airline themes
Plug 'vim-airline/vim-airline-themes'
" File browser within vim
Plug 'scrooloose/nerdtree'
" Syntax checker
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" Easily add brackets, parentheses etc
Plug 'tpope/vim-surround'
" Enable repeating with plugin maps
Plug 'tpope/vim-repeat'
" Auto completion using tab
Plug 'ervandew/supertab'
" Visually display indent levels
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" Full path fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Fancy formatting
Plug 'godlygeek/tabular'
" Simplify motions
Plug 'easymotion/vim-easymotion'
" Git wrapper for vim
Plug 'tpope/vim-fugitive'
" Color parenthesis levels
Plug 'luochen1990/rainbow'
" Improved code commenting features
Plug 'scrooloose/nerdcommenter'
" Ruby vim support
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Tmux pane switching awareness
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
" Code completion engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Git for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Python docstring generator
Plug 'heavenshell/vim-pydocstring'
" General-purpose command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Vim plugin which shows a git diff
Plug 'airblade/vim-gitgutter'
" Plugin to move selected lines up and down
Plug 'matze/vim-move'
" Vim plugin that adds additional text objects
Plug 'wellle/targets.vim'
" Buffer explorer
Plug 'jlanzarotta/bufexplorer'
" Visualize vim undo tree
Plug 'simnalamburt/vim-mundo'

" Initialize plugin system
call plug#end()

" Required:
filetype plugin indent on

" Colorscheme
syntax on
" hi clear
colorscheme gruvbox
set background=dark
" hi NonText ctermbg=NONE
" hi Normal guibg=NONE ctermbg=NONE

" Set clipboard to global
set clipboard=unnamedplus
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
map <Leader>vs :vsplit 
map <Leader>hs :split 
" Remap escape key to jj, jk kj
inoremap jj <Esc> 
inoremap jk <Esc> 
inoremap kj <Esc> 
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
  " Escape in terminal switches to normal mode
  tnoremap <Esc> <c-\><c-n>
endif

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo

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

"###### ALE
" Enable completion where available.
let g:ale_completion_enabled = 1

"###### Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=0
let g:syntastic_auto_loc_list=0
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0

let g:syntastic_java_checkers=['checkstyle', 'javac']
let g:syntastic_c_checkers=['gcc', 'make']
let g:syntastic_html_checkers=['jshint', 'w3']
let g:syntastic_sql_checkers=['sqlint']
let g:syntastic_tex_checkers=['chktex']
let g:syntastic_matlab_checkers=['mlint']
let g:syntastic_text_checkers=['atdtool']
let g:syntastic_scala_checkers=['scalac', 'fsc']
let g:syntastic_python_checkers=['mypy', 'pylint', 'python']
map <Leader>S :SyntasticCheck<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='base16_monokai'
" Show buffers on top
let g:airline#extensions#tabline#enabled = 1

"##### NERDTree
"autocmd vimenter * NERDTree
map <Leader>N :NERDTreeToggle<CR>
map <Leader>n :NERDTreeToggle<CR>
map <C-n> :NERDTreeToggle<CR>

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
"let g:SuperTabDefaultCompletionType = 'context'
"let g:EclimCompletionMethod = 'omnifunc'
"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" ##### Vim ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
autocmd FileType ruby compiler ruby

" ##### YCM
" Use first python in path to support non-system pythons(e.g. virtualenv,
" anaconda)
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" ##### SuperTab
"let g:SuperTabClosePreviewOnPopupClose = 1


" ##### CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <c-b> :CtrlPBuffer<CR>

" ##### NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" ##### Pydocstring
" autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" ##### indentLine
" let g:indentLine_setColors = 0
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '┆'
let g:indentLine_leadingSpaceChar = '·'

" Vim mundo
nnoremap <F5> :MundoToggle<CR>
