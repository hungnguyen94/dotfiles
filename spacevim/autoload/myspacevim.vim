function! myspacevim#before() abort
  "# Spacevim
  let g:spacevim_vimcompatible=0  " Allow overriding vim defaults
  let g:spacevim_windows_smartclose=''  " Restore default macro behaviour
  let g:spacevim_windows_leader='s'  " Window leader key
  let g:spacevim_enable_language_specific_leader=0
  let g:spacevim_autocomplete_method='deoplete'
  let g:spacevim_enable_ale=1
  " Disable spacevim statusline and use airline
  call SpaceVim#layers#disable('core#statusline')
  call SpaceVim#layers#disable('core#tabline')
  let g:spacevim_statusline_left_sections=['winnr', 'filename', 'major mode', 'syntax checking']
  let g:spacevim_statusline_right_sections=['fileformat', 'cursorpos', 'percentage']
  let g:vimfiler_direction='topleft'
  let g:spacevim_enable_vimfiler_filetypeicon=1
  let g:spacevim_buffer_index_type=4

  if has(('persistent_undo'))
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
  set ttimeout ttimeoutlen=200 timeoutlen=500  " Timeout on keycodes e.g. [SPC]
  set virtualedit+=block
  set cmdheight=2  " Better display for messages
  set signcolumn=yes  " always show signcolumns

  cmap w!! w suda://%|                  " Save file using sudo
  inoremap jj <Esc>
  noremap 0 ^|                        " Go to the first non-blank character of a line
  noremap ^ 0|                        " Go to the first non-blank character of a line
  vnoremap <Down> gj|                 " Move between one displayed line, useful for wrapped lines
  vnoremap <Up> gk|                   " Move between one displayed line, useful for wrapped lines
  nnoremap <Return> i<Return><Esc>|   " Insert a linebreak at the cursor
  " Yank to both unnamed register and unnamedplus system clipboard
  vnoremap Y "+ygvy
  vnoremap y "+ygvy
  nnoremap yy "+YY
  " Paste only from system clipboard. Remap bracket paste to unnamed register
  nnoremap [p P
  nnoremap ]p p
  nnoremap p "+p
  nnoremap P "+P

  " Spacevim specific mappings for window splitting
  nnoremap <silent> [Window]- :<C-u>split<CR>:wincmd w<CR>
  nnoremap <silent> [Window]\| :<C-u>vsplit<CR>:wincmd w<CR>

  "# NERDCommenter
  let g:NERDSpaceDelims=1            " Add spaces after comment delimiters by default
  let g:NERDCompactSexyComs=1        " Do use compact syntax for prettified multi-line comments
  let g:NERDRemoveExtraSpaces=0
  let g:NERDCommentEmptyLines=1      " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDTrimTrailingWhitespace=1 " Enable trimming of trailing whitespace when uncommenting

  "# IndentLine
  let g:indentLine_enabled=1
  let g:indentLine_leadingSpaceEnabled=1
  let g:indentLine_leadingSpaceChar='·'
  let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']
  let g:indentLine_char='¦'
  let g:indentLine_setColors=1
  let g:indentLine_setConceal=1

  "# airline
  let g:airline_powerline_fonts=1
  let g:airline_symbols_ascii=1
  let g:airline_exclude_preview=1
  let g:airline_skip_empty_sections=1
  let g:airline_detect_iminsert=1
  let g:airline_theme='gruvbox'
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
  let g:airline#extensions#tmuxline#enabled=0
  let g:airline#extensions#tabline#enabled=1
  let g:airline#extensions#tabline#show_buffers=1 " Show buffers on top
  let g:airline#extensions#tabline#buffer_idx_mode=0
  let g:airline#extensions#tabline#tab_nr_type=2
  let g:airline#extensions#tabline#tabnr_formatter='tabnr'
  let g:airline#extensions#tabline#buffers_label='BUFFERS'
  let g:airline#extensions#tabline#tabs_label='TABS'
  let g:airline#extensions#tabline#formatter='spacevim'

  "# EasyMotion
  let g:EasyMotion_smartcase=1  " Enable case insensitive search

  "# Rainbow Parenthesis
  let g:rainbow_active=1

  "# Deoplete
  let g:deoplete#enable_at_startup=1

  "# Echodoc
  let g:echodoc#enable_at_startup=1
  let g:echodoc#type='signature'

  " Language server protocol
  let g:LanguageClient_autoStart=1
  let g:LanguageClient_hasSnippetSupport=0  " LSP snippet is not supported
  let g:LanguageClient_selectionUI='fzf'
  let g:LanguageClient_useVirtualText=1
  let g:LanguageClient_serverCommands={
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
        \ 'python': ['~/conda3/envs/py36/bin/pyls'],
        \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
        \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
        \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
        \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
        \ 'scala': ['metals-vim'],
        \ }

  " Trigger transparent_background on colorscheme
  func! s:transparent_background()
    highlight Normal guibg=NONE ctermbg=NONE
  endf
  autocmd ColorScheme * call s:transparent_background()

  " Close preview window on exit
  autocmd InsertLeave,CompleteDone * if (pumvisible() == 0 && !bufexists("[Command Line]")) | pclose | endif
endfunction

function! myspacevim#after() abort
  nunmap <F2>
  nnoremap <F2> :call LanguageClient_contextMenu()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
  nnoremap <silent> <M-k> :call LanguageClient#textDocument_references({'includeDeclaration': v:true})<cr>
  call myspacevim#airline_register_mappings()
endfunction

function! myspacevim#airline_register_mappings() abort
  call SpaceVim#mapping#def('nmap', '<leader>1', '<Plug>AirlineSelectTab1', 'Switch to airline tab 1', '', 'window 1')
  call SpaceVim#mapping#def('nmap', '<leader>2', '<Plug>AirlineSelectTab2', 'Switch to airline tab 2', '', 'window 2')
  call SpaceVim#mapping#def('nmap', '<leader>3', '<Plug>AirlineSelectTab3', 'Switch to airline tab 3', '', 'window 3')
  call SpaceVim#mapping#def('nmap', '<leader>4', '<Plug>AirlineSelectTab4', 'Switch to airline tab 4', '', 'window 4')
  call SpaceVim#mapping#def('nmap', '<leader>5', '<Plug>AirlineSelectTab5', 'Switch to airline tab 5', '', 'window 5')
  call SpaceVim#mapping#def('nmap', '<leader>6', '<Plug>AirlineSelectTab6', 'Switch to airline tab 6', '', 'window 6')
  call SpaceVim#mapping#def('nmap', '<leader>7', '<Plug>AirlineSelectTab7', 'Switch to airline tab 7', '', 'window 7')
  call SpaceVim#mapping#def('nmap', '<leader>8', '<Plug>AirlineSelectTab8', 'Switch to airline tab 8', '', 'window 8')
  call SpaceVim#mapping#def('nmap', '<leader>9', '<Plug>AirlineSelectTab9', 'Switch to airline tab 9', '', 'window 9')
  call SpaceVim#mapping#def('nmap', '<leader>-', '<Plug>AirlineSelectPrevTab', 'Switch to previous airline tag', '', 'window previous')
  call SpaceVim#mapping#def('nmap', '<leader>+', '<Plug>AirlineSelectNextTab', 'Switch to next airline tag', '', 'window next')
  call SpaceVim#mapping#space#def('nmap', [1], '<Plug>AirlineSelectTab1', 'window 1', 0)
  call SpaceVim#mapping#space#def('nmap', [2], '<Plug>AirlineSelectTab2', 'window 2', 0)
  call SpaceVim#mapping#space#def('nmap', [3], '<Plug>AirlineSelectTab3', 'window 3', 0)
  call SpaceVim#mapping#space#def('nmap', [4], '<Plug>AirlineSelectTab4', 'window 4', 0)
  call SpaceVim#mapping#space#def('nmap', [5], '<Plug>AirlineSelectTab5', 'window 5', 0)
  call SpaceVim#mapping#space#def('nmap', [6], '<Plug>AirlineSelectTab6', 'window 6', 0)
  call SpaceVim#mapping#space#def('nmap', [7], '<Plug>AirlineSelectTab7', 'window 7', 0)
  call SpaceVim#mapping#space#def('nmap', [8], '<Plug>AirlineSelectTab8', 'window 8', 0)
  call SpaceVim#mapping#space#def('nmap', [9], '<Plug>AirlineSelectTab9', 'window 9', 0)
  call SpaceVim#mapping#space#def('nmap', ['-'], '<Plug>AirlineSelectPrevTab', 'window previous', 0)
  call SpaceVim#mapping#space#def('nmap', ['+'], '<Plug>AirlineSelectNextTab', 'window next', 0)
  " Alias in the spacevim guide
  let g:_spacevim_mappings_windows['|'] = g:_spacevim_mappings_windows.g
  let g:_spacevim_mappings_windows['-'] = g:_spacevim_mappings_windows.v
endfunction
