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
call plug#begin('~/.vim/plugged')
  Plug 'flazz/vim-colorschemes'                                     " Colorschemes
  Plug 'bling/vim-airline'                                          " Powerline-style bar
  Plug 'vim-airline/vim-airline-themes'                             " Airline themes
  Plug 'scrooloose/nerdtree'                                        " File browser within vim
  Plug 'w0rp/ale'                                                   " Syntax checker
  Plug 'morhetz/gruvbox'                                            " Gruvbox colorscheme
  Plug 'tpope/vim-surround'                                         " Easily add brackets, parentheses etc
  Plug 'tpope/vim-repeat'                                           " Enable repeating with plugin maps
  Plug 'ervandew/supertab'                                          " Auto completion using tab
  Plug 'nathanaelkane/vim-indent-guides'                            " Visually display indent levels
  Plug 'ctrlpvim/ctrlp.vim'                                         " Full path fuzzy finder
  Plug 'junegunn/vim-easy-align'                                    " Easily align text
  Plug 'easymotion/vim-easymotion'                                  " Simplify motions
  Plug 'unblevable/quick-scope'                                     " Highlight target characters for f
  Plug 'tpope/vim-fugitive'                                         " Git wrapper for vim
  Plug 'luochen1990/rainbow'                                        " Color parenthesis levels
  Plug 'scrooloose/nerdcommenter'                                   " Improved code commenting features
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }                       " Ruby vim support
  Plug 'christoomey/vim-tmux-navigator'                             " Tmux pane switching awareness
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }           " Code completion engine
  Plug 'Xuyuanp/nerdtree-git-plugin'                                " Git for nerdtree
  " Plug 'heavenshell/vim-pydocstring'{ 'for': 'python' }           " Python docstring generator
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " General-purpose command-line fuzzy finder
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'                                     " Vim plugin which shows a git diff
  Plug 'matze/vim-move'                                             " Plugin to move selected lines up and down
  Plug 'wellle/targets.vim'                                         " Vim plugin that adds additional text objects
  Plug 'jlanzarotta/bufexplorer'                                    " Buffer explorer
  Plug 'simnalamburt/vim-mundo'                                     " Visualize vim undo tree
  Plug 'mileszs/ack.vim'                                            " Ack in vim
  Plug 'terryma/vim-expand-region'                                  " Visually select increasingly larger regions of text
  Plug 'sheerun/vim-polyglot'                                       " A collection of language packs for Vim
  Plug 'KeitaNakamura/neodark.vim'                                  " Neodark colorscheme
  Plug 'vim-python/python-syntax'                                   " Improved Python syntax highlighting
call plug#end()
filetype plugin indent on

" Colorscheme
let g:neodark#use_256color=1 
let g:neodark#terminal_transparent=1
colorscheme neodark
" set background=dark
" hi NonText ctermbg=NONE
" hi Normal guibg=NONE ctermbg=NONE



set clipboard=unnamedplus  " Set clipboard to global
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
noremap <Leader>vs :vsplit 
noremap <Leader>hs :split 
" Remap escape key to jj, jk kj
inoremap jj <Esc> 
inoremap jk <Esc> 
" Move between one displayed line, useful for wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" Insert a linebreak at the cursor
nnoremap <Return> i<Return><Esc>

"NeoVim bindings
if has('nvim')
" Escape in terminal switches to normal mode
  tnoremap <Esc> <c-\><c-n>
endif


set undofile          " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undo

" Options
set number
set relativenumber
set cursorline
set linebreak
set nowrap
set textwidth=0 " Line wrap (number of cols)
set wrapmargin=0
set showmatch
set nohlsearch  " Dont highlight all matches
set smartcase
set incsearch   " Incremental search
set autoindent  " Indent using spaces
set tabstop=4
set expandtab 
set softtabstop=2
set shiftwidth=2
set smarttab
set smartindent
set showcmd     " Display pressed keys in normal
set autoread    " Automatically refresh files
set complete-=i
set backspace=indent,eol,start

"# Vim-indent-guides
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_color_change_percent=4
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
" autocmd VimEnter,Colorscheme * :hi CursorLine ctermbg=239
" autocmd VimEnter,Colorscheme * :hi LineNr ctermfg=242

"# ALE

let g:ale_completion_enabled = 1                  " Enable completion where available.
let g:ale_python_flake8_options = '--ignore E501' " Disable line too long error
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1                         " Run autopep8 on save to autoformat code
let g:ale_fixers = {
\   'python': ['autopep8'],
\}
let g:ale_linters = {
\   'python': ['flake8', 'pycodestyle'],
\}

"# airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1 " Show buffers on top
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ale#enabled = 1

"# NERDTree
noremap <Leader>n :NERDTreeToggle<CR>
noremap <C-n> :NERDTreeToggle<CR>

"# Tabularize
nnoremap <Leader>]: :Tabularize /:\zs<CR>
vnoremap <Leader>]: :Tabularize /:\zs<CR>
nnoremap <Leader>] :Tabularize /
vnoremap <Leader>] :Tabularize /

"# EasyMotion
map ` <Plug>(easymotion-prefix)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)

"# Rainbow Parenthesis
let g:rainbow_active=1

"# Eclim
" let g:SuperTabDefaultCompletionType = 'context'
" let g:EclimCompletionMethod = 'omnifunc'
" let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

"# Vim ruby
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_use_bundler = 1
autocmd FileType ruby compiler ruby

"# YCM
" Use first python in path to support non-system pythons (e.g. virtualenv, anaconda)
let g:ycm_python_binary_path = 'python'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

"# SuperTab
" let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabCompleteCase = 1

"# CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Buffer
nnoremap <c-b> :CtrlPBuffer<CR>

"# NERDCommenter

let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 0        " Don't use compact syntax for prettified multi-line comments
let g:NERDRemoveExtraSpaces = 0
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

"# Pydocstring
" autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"# Vim mundo
nnoremap <F5> :MundoToggle<CR>

"# quick-scope

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']  " Trigger a highlight in the appropriate direction 

"# vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
