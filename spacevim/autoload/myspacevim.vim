function! myspacevim#before() abort
  let g:airline#extensions#tmuxline#enabled=0
  "# Rainbow Parenthesis
  let g:rainbow_active=1
  set clipboard=unnamed "Set clipboard to global

  if has(('persistent_undo'))
    set undofile          " Enable persistent undo so that undo history persists across vim sessions
    set undodir=~/.vim/undo
  endif

  inoremap jj <Esc>
  set hidden
  set number relativenumber cursorline
  set linebreak wrap " Show wrapped lines
  set showbreak=\\\ 
  set showmatch      " Briefly show matching bracket on insert
  set nohlsearch incsearch smartcase  " Dont highlight all matches, use incremental search
  set smartindent autoindent
  set showcmd     " Display pressed keys in normal
  set autoread    " Automatically refresh files
  set virtualedit+=block
  set signcolumn=yes  " always show signcolumns

  call SpaceVim#custom#SPCGroupName(['L'], '+Language Specified Custom')
  call SpaceVim#custom#SPC('nnoremap', ['L', 's'], 'CocList symbols', 'Go to symbol in workspace', 1)
endfunction
