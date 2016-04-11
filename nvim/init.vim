" NEOVIM CONFIGURATION
" ~/.config/nvim/init.vim
" By Kemble Song
" ===============================================================================

" Map the leader key to space
let g:mapleader = "\<Space>" 
" Enable glorious 24bit true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 

" Plugins
" ===============================================================================

call plug#begin()

Plug 'mhinz/vim-startify'
  let g:startify_custom_header = 
      \ map(split(system('fortune'), '\n'), '"   ". v:val') + ['','']

Plug 'NLKNguyen/papercolor-theme'

Plug 'jszakmeister/vim-togglecursor'
Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf' }
Plug 'junegunn/fzf.vim'
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  let $FZF_DEFAULT_OPTS='--color=bw'
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ 'mode_map' : {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ '?': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "✎"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "∅"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⎇ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != LightLineModified() ? LightLineModified() . ' ' : '') . 
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-bufferline'
  let g:bufferline_show_bufnr = 0

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  nnoremap <leader>\ :NERDTreeToggle<CR>

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'css'] }

Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
Plug 'gavocanov/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'html'] }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'javascript.jsx' ] }
  let g:jsx_ext_required = 0

Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key = '<C-A>'

Plug 'junegunn/goyo.vim'
  nnoremap <leader>df :Goyo<CR>

Plug 'tpope/vim-surround'

Plug 'elixir-lang/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }

Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" UI
" ==============================================================================
set background=light
colorscheme PaperColor
set number              " Show line numbers
set cursorline          " Highlight cursor line
set showmatch           " Show matching brackets
set showcmd             " Show command
set showmatch           " Show match
set ruler               " Show line positions
set visualbell          " don't beep
set noerrorbells        " don't beep
set laststatus=2        " Show last status
set noshowmode          " don't show default mode indicator
set fillchars=vert:\    " Change vertical separator character to <space>
set showtabline=0       " Don't show tabline

" Editor
" ==============================================================================

set expandtab	          " Tabs to spaces
set smarttab            " Smart tabs
set shiftwidth=2        " Shidt width
set tabstop=2           " Set tabwidth to 2
set hlsearch            " Highlight search results.
set incsearch           " Jump to search result
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set ai                  " Set auto indent
set si                  " Set smart indent
set nowrap              " Don't wrap lines
set hidden              " Allows buffers to be hidden even if modified.


" Keybindings
" ==============================================================================

" Open a new empty buffer
nnoremap <silent><leader>T :enew<cr>
" Move to the next buffer
nnoremap <silent><leader>l :bnext<CR>
" Move to the previous buffer
nnoremap <silent><leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nnoremap <silent><leader>w :bp <BAR> bd #<CR>
" Show all open buffers and their status
nnoremap <silent><leader>bl :ls<CR>
" Clear highlight
nnoremap <silent><leader>c :noh<CR>
" Edit neovim config
nnoremap <silent><leader>ec :e<space>~/.config/nvim/init.vim<CR>
" Edit zsh config
nnoremap <silent><leader>ez :e<space>~/.zshrc<CR>
" Edit tmux config
nnoremap <silent><leader>et :e<space>~/.tmux.conf<CR>
" Save
nnoremap <silent><leader>s :w<CR>
" Quit 
nnoremap <silent><leader>q :q<CR>
" Toggle relative/absolute line numbers
nnoremap <silent><leader>n :set rnu! rnu? <cr>
" jk is escape
inoremap jk <esc>

if has('nvim')
  " fix <c-h> in neovim
  nnoremap <BS> <C-W>h  
endif
