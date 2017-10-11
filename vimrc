if has('nvim')
  set termguicolors " Enable true color support
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
  set guicursor=
endif

if has('gui_running')
  " No toolbar
  set guioptions-=T
  set guioptions-=L
endif

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
  Plug 'tpope/vim-fugitive'                                         " Git wrapper for vim
  Plug 'luochen1990/rainbow'                                        " Color parenthesis levels
  Plug 'scrooloose/nerdcommenter'                                   " Improved code commenting features
  Plug 'christoomey/vim-tmux-navigator'                             " Tmux pane switching awareness
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'Valloric/YouCompleteMe', { 'do': 
        \ './install.py --clang-completer --tern-completer' }       " Code completion engine
  Plug 'Xuyuanp/nerdtree-git-plugin'                                " Git for nerdtree
  " Plug 'heavenshell/vim-pydocstring'{ 'for': 'python' }           " Python docstring generator
  Plug 'junegunn/fzf.vim'                                           " General-purpose command-line fuzzy finder
  Plug 'airblade/vim-gitgutter'                                     " Vim plugin which shows a git diff
  Plug 'matze/vim-move'                                             " Plugin to move selected lines up and down
  Plug 'wellle/targets.vim'                                         " Vim plugin that adds additional text objects
  Plug 'jlanzarotta/bufexplorer'                                    " Buffer explorer
  Plug 'simnalamburt/vim-mundo'                                     " Visualize vim undo tree
  Plug 'mileszs/ack.vim'                                            " Ack in vim
  Plug 'terryma/vim-expand-region'                                  " Visually select increasingly larger regions of text
  Plug 'KeitaNakamura/neodark.vim'                                  " Neodark colorscheme
  Plug 'yuttie/comfortable-motion.vim'                              " Physics-based smooth scrolling
  Plug 'unblevable/quick-scope'                                     " Highlight target characters for f
  Plug 'easymotion/vim-easymotion'                                  " Simplify motions
  Plug 'haya14busa/incsearch.vim'                                   " Incrementally highlight all pattern matches
  Plug 'haya14busa/incsearch-easymotion.vim'                        " Easymotion integration for incsearch
  Plug 'reedes/vim-pencil'                                          " Tweaks for writing text
  Plug 'sheerun/vim-polyglot'                                       " A collection of language packs for Vim
call plug#end()
filetype plugin indent on

" Colorscheme
" let g:neodark#use_256color=0
let g:neodark#terminal_transparent=1
" let g:neodark#background='#202020'
" let g:neodark#solid_vertsplit=1
colorscheme neodark
" let g:onedark_terminal_italics=1
" hi NonText ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

set clipboard=unnamedplus  " Set clipboard to global

cmap w!! w !sudo tee > /dev/null %| " Save file using sudo
noremap <Leader>vs :vsplit|         " Split vertical
noremap <Leader>hs :split|          " Split horizontal
inoremap jj <Esc>|                  " Remap escape key to jj
inoremap jk <Esc>|                  " Remap escape key to jk
nnoremap <Down> gj|                 " Move between one displayed line, useful for wrapped lines
nnoremap <Up> gk|                   " Move between one displayed line, useful for wrapped lines
vnoremap <Down> gj|                 " Move between one displayed line, useful for wrapped lines
vnoremap <Up> gk|                   " Move between one displayed line, useful for wrapped lines
noremap 0 ^|                        " Go to the first non-blank character of a line
noremap ^ 0|                        " Go to the first non-blank character of a line
nnoremap <Return> i<Return><Esc>|   " Insert a linebreak at the cursor

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
set ignorecase
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
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
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
let g:ycm_python_binary_path = 'python' " Use first python in path to support non-system pythons (e.g. virtualenv, anaconda)
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
xmap ga <Plug>(EasyAlign)| " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)| " Start interactive EasyAlign for a motion/text object (e.g. gaip)

"# Pencil
augroup pencil
  autocmd!
  autocmd FileType text         call pencil#init()
  autocmd FileType markdown,mkd call pencil#init()
                            \ | call lexical#init()
                            \ | call litecorrect#init()
                            \ | call textobj#quote#init()
                            \ | call textobj#sentence#init()
augroup END

"# Comfortable motion
let g:comfortable_motion_no_default_key_mappings = 1
nmap <C-f> :call comfortable_motion#flick(200)<CR>
nmap <C-b> :call comfortable_motion#flick(-200)<CR>

"# Polyglot
" let g:polyglot_disabled = ['markdown']

"# EasyMotion
let g:EasyMotion_smartcase = 1 " Enable case insensitive search
map ` <Plug>(easymotion-prefix)| " EasyMotion prefix
map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s)
