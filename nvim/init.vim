" NEOVIM CONFIGURATION
" ~/.config/nvim/init.vim
" Kemble Song <kemblesong>
" ===============================================================================

" Map the leader key to space
let g:mapleader = "\<Space>"
" Enable glorious 24bit true color
if has('termguicolors')
  set termguicolors
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum
endif

" Plugins
" ===============================================================================
call plug#begin()

Plug 'rakr/vim-one'
Plug 'lifepillar/vim-wwdc17-theme'
Plug 'lifepillar/vim-solarized8'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='solarized'

Plug 'jszakmeister/vim-togglecursor'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
  nnoremap <silent> <leader>\ :VimFilerExplorer<CR>

Plug 'w0rp/ale'
  let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ 'scss': [],
  \}

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
endif

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :Tags<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>/ :Ag<CR>
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

  if has('nvim')
    let g:fzf_nvim_statusline = 0
  endif

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color'

Plug 'junegunn/goyo.vim'
  nnoremap <leader>df :Goyo<CR>

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'sheerun/vim-polyglot'
  autocmd Filetype javascript setlocal ts=4 sw=4
  autocmd Filetype scss setlocal ts=4 sw=4
  autocmd Filetype html setlocal ts=4 sw=4
  autocmd Filetype htmldjango setlocal ts=4 sw=4
  autocmd Filetype liquid setlocal ts=4 sw=4

call plug#end()

" UI
" ==============================================================================
set background=light
colorscheme solarized8
set number              " Show line numbers
set relativenumber      " Set relative line numbers as default
set cursorline          " Highlight cursor line
set showmatch           " Show matching brackets
set showcmd             " Show command
set ruler               " Show line positions
set visualbell          " don't beep
set noerrorbells        " don't beep
set noshowmode          " don't show mode
set laststatus=2        " don't show last status
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
nnoremap <silent><leader>ev :e<space>~/.config/nvim/init.vim<CR>
" Edit fish config
nnoremap <silent><leader>ef :e<space>~/.config/fish/config.fish<CR>
" Edit tmux config
nnoremap <silent><leader>et :e<space>~/.tmux.conf<CR>
" Save
nnoremap <silent><leader>s :w<CR>
" Quit
nnoremap <silent><leader>q :q<CR>
" Toggle relative/absolute line numbers
nnoremap <silent><leader>n :set rnu! rnu? <cr>
" ; is :
nnoremap ; :
" jk is escape
inoremap jk <esc>
" System clipboard copy/paste
vnoremap <silent><Leader>d "+d
vnoremap <silent><Leader>y "+y
vnoremap <silent><Leader>p "+p
vnoremap <silent><Leader>P "+P
nnoremap <silent><Leader>d "+d
nnoremap <silent><Leader>y "+y
nnoremap <silent><Leader>p "+p
nnoremap <silent><Leader>P "+P
" Better start/end line navigation
nnoremap H ^
nnoremap L $

" Removes trailing spaces
nnoremap <silent><Leader>t :call TrimWhiteSpace()<CR>

" Misc functions / auto commands
" ==============================================================================
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
