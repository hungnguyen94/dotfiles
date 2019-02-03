if has('gui_running')
  set guioptions-=T  " No toolbar
  set guioptions-=L
endif

call plug#begin('~/.vim/plugged')
  if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
 
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'sebastianmarkow/deoplete-rust'
  " Plug 'zchee/deoplete-jedi'
  Plug 'flazz/vim-colorschemes'                                     " Colorschemes
  Plug 'vim-airline/vim-airline'                                    " Powerline-style bar
  Plug 'vim-airline/vim-airline-themes'                             " Airline themes
  Plug 'scrooloose/nerdtree'                                        " File browser within vim
  Plug 'w0rp/ale'                                                   " Syntax checker
  " Plug 'morhetz/gruvbox'                                            " Gruvbox colorscheme
  Plug 'tpope/vim-surround'                                         " Easily add brackets, parentheses etc
  Plug 'tpope/vim-repeat'                                           " Enable repeating with plugin maps
  Plug 'ervandew/supertab'                                          " Auto completion using tab
  " Plug 'nathanaelkane/vim-indent-guides'                            " Visually display indent levels
  Plug 'Yggdroot/indentLine'                                        " Display indent lines
  " Plug 'ctrlpvim/ctrlp.vim'                                         " Full path fuzzy finder
  Plug 'junegunn/vim-easy-align'                                    " Easily align text
  " Plug 'tpope/vim-fugitive'                                         " Git wrapper for vim
  Plug 'luochen1990/rainbow'                                        " Color parenthesis levels
  Plug 'scrooloose/nerdcommenter'                                   " Improved code commenting features
  Plug 'christoomey/vim-tmux-navigator'                             " Tmux pane switching awareness
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'Xuyuanp/nerdtree-git-plugin'                                " Git for nerdtree
  Plug 'junegunn/fzf.vim'                                           " General-purpose command-line fuzzy finder
  Plug 'airblade/vim-gitgutter'                                     " Vim plugin which shows a git diff
  Plug 'wellle/targets.vim'                                         " Vim plugin that adds additional text objects
  " Plug 'jlanzarotta/bufexplorer'                                    " Buffer explorer
  " Plug 'simnalamburt/vim-mundo'                                     " Visualize vim undo tree
  Plug 'mbbill/undotree'                                            " Visualize vim undo tree
  Plug 'mileszs/ack.vim'                                            " Ack in vim
  Plug 'terryma/vim-expand-region'                                  " Visually select increasingly larger regions of text
  Plug 'KeitaNakamura/neodark.vim'                                  " Neodark colorscheme
  Plug 'unblevable/quick-scope'                                     " Highlight target characters for f
  Plug 'easymotion/vim-easymotion'                                  " Simplify motions
  Plug 'haya14busa/incsearch.vim'                                   " Incrementally highlight all pattern matches
  Plug 'haya14busa/incsearch-easymotion.vim'                        " Easymotion integration for incsearch
  Plug 'reedes/vim-pencil'                                          " Tweaks for writing text
  Plug 'sheerun/vim-polyglot'                                       " A collection of language packs for Vim
  Plug 'tpope/vim-unimpaired'                                       " Pairs of handy bracket mappings
  Plug 'SirVer/ultisnips'                                           " Snippets engine
  Plug 'honza/vim-snippets'                                         " Default snippets
  Plug 'vim-ctrlspace/vim-ctrlspace'                                " tabs / buffers / files management / fast fuzzy searching
  Plug 'fszymanski/deoplete-emoji'                                  " Deoplete emoji completion
  Plug 'derekwyatt/vim-scala'                                       " Scala & sbt syntax highlighting
  Plug 'lambdalisue/suda.vim'                                       " Save using sudo support
call plug#end()


filetype plugin indent on

" Colorscheme
let g:neodark#use_256color=0
" let g:neodark#terminal_transparent=1
" let g:neodark#background='#202020'
" let g:neodark#solid_vertsplit=1
colorscheme neodark
" let g:onedark_terminal_italics=1
hi NonText ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

set clipboard=unnamedplus  " Set clipboard to global

cmap w!! suda://%|                  " Save file using sudo
" cmap w!! w !sudo tee > /dev/null %| " Save file using sudo
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
xnoremap <leader>c <esc>:'<,'>:w !| " Send selected text to stdin of command

" NeoVim bindings
if has('nvim')
  tnoremap <Esc> <c-\><c-n>|  " Escape in terminal switches to normal mode
endif


if has('persistent_undo')
  set undofile          " Enable persistent undo so that undo history persists across vim sessions
  set undodir=~/.vim/undo
endif

" Options
set hidden
set number relativenumber cursorline
set linebreak wrap " Show wrapped lines
set showbreak=\\\ 
set showmatch      " Briefly show matching bracket on insert
set nohlsearch incsearch smartcase  " Dont highlight all matches, use incremental search
set smartindent autoindent
set expandtab smarttab " Use spaces for tab
set softtabstop=4
set shiftwidth=4
set showcmd     " Display pressed keys in normal
set autoread    " Automatically refresh files
set virtualedit+=block

"# ALE
let g:ale_completion_enabled = 1                  " Enable completion where available.
let g:ale_python_flake8_options = '--ignore E501,E731' " Disable line too long error
let g:ale_python_autopep8_options = '--ignore E501,E731'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 0                         " Run autopep8 on save to autoformat code
let g:ale_fixers = { 'python': ['autopep8'] }
let g:ale_linters = { 'python': ['flake8', 'mypy'] }

"# airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16' " 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1 " Show buffers on top
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ale#enabled = 1

"# NERDTree
noremap <C-n> :NERDTreeToggle<CR>

"# Rainbow Parenthesis
let g:rainbow_active=1

"# SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 0
" let g:SuperTabCompleteCase = 1

"# CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_cmd = 'CtrlPBuffer'
" Buffer
" nnoremap <c-b> :CtrlPBuffer<CR>

"# NERDCommenter
let g:NERDSpaceDelims = 1            " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1        " Do use compact syntax for prettified multi-line comments
let g:NERDRemoveExtraSpaces = 0
let g:NERDCommentEmptyLines = 1      " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting

"# Vim undotree
nnoremap <F5> :UndotreeToggle<CR>

"# quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']  " Trigger a highlight in the appropriate direction

"# vim-easy-align
xmap ga <Plug>(EasyAlign)| " Start interactive EasyAlign in visual mode (e.g. vipga)
nmap ga <Plug>(EasyAlign)| " Start interactive EasyAlign for a motion/text object (e.g. gaip)

"# Pencil
"augroup pencil
"  autocmd!
"  autocmd FileType text         call pencil#init()
"  autocmd FileType markdown,mkd call pencil#init()
"                            \ | call lexical#init()
"                            \ | call litecorrect#init()
"                            \ | call textobj#quote#init()
"                            \ | call textobj#sentence#init()
"augroup END

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

"# Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" Language server protocol
let g:LanguageClient_hasSnippetSupport = 0  " LSP snippet is not supported
let g:LanguageClient_selectionUI = 'fzf'
let g:LanguageClient_useVirtualText  = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
    \ 'python': ['~/conda3/envs/py36/bin/pyls'],
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'scala': ['metals-vim'],
    \ }


nnoremap <F2> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> <M-k> :call LanguageClient#textDocument_references({'includeDeclaration': v:true})<cr>

" LSP for C-type files
fu! C_init()
  setl formatexpr=LanguageClient#textDocument_rangeFormatting()
endf
au FileType c,cpp,cuda,objc :call C_init()

"# IndentLine
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_char = '¦'
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 1

"# CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceSymbols = { "CS": "#", "ALL": "∀" }

"# vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala
