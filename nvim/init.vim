" NEOVIM CONFIGURATION
" ~/.config/nvim/init.vim
" Kemble Song <kemblesong>
" ===============================================================================

" Map the leader key to space
let g:mapleader = "\<Space>"
" True color support
set termguicolors

" Plugins
" ===============================================================================
call plug#begin()

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
  let g:airline_left_sep = ' '
  let g:airline_right_sep = ' '
  let g:airline_powerline_fonts = 1
  "let g:airline#extensions#tabline#enabled = 1

Plug 'jszakmeister/vim-togglecursor'

Plug 'neovim/node-host'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
  nnoremap <silent> <leader>\ :VimFilerExplorer<CR>

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

Plug 'neomake/neomake'
  autocmd! BufWritePost * Neomake

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_nvim_statusline = 0
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

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'css'] }

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
  nnoremap <leader>df :Goyo<CR>
  "autocmd! User GoyoEnter Limelight
  "autocmd! User GoyoLeave Limelight!

Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs', { 'for': 'javascript' }

Plug 'christoomey/vim-tmux-navigator'

Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
  let g:jsx_ext_required = 0

" Elm
Plug 'ElmCast/elm-vim', { 'for': 'elm' }

" Lua
Plug 'tbastos/vim-lua', { 'for': 'lua' }

" Moonscript
Plug 'leafo/moonscript-vim', { 'for': 'moon' }

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  let g:racer_cmd = "/Users/kemble/.cargo/bin/racer"
  let g:rustfmt_autosave = 1

" TOML
Plug 'cespare/vim-toml', { 'for': 'toml' }

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'cabal'] }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }

" Go
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_types = 1
  let g:go_highlight_operators = 1
  let g:go_fmt_command = "goimports"
  au FileType go setl tabstop=4 shiftwidth=4

" C++
Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
  let g:deoplete#sources#clang#libclang_path = "/Library/Developer/CommandLineTools/usr/lib/libclang.dylib"
  let g:deoplete#sources#clang#clang_header = "/Library/Developer/CommandLineTools/usr/lib/clang/7.3.0/include/"
  let g:neomake_cpp_clang_maker = { 'args': ['-fsyntax-only', '-std=c++14', '-Wall', '-Wextra', '-Iinclude'] }
  au FileType cpp setl tabstop=4 shiftwidth=4

" Clojure / ClojureScript
Plug 'clojure-vim/nvim-parinfer.js', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

call plug#end()

" UI
" ==============================================================================
set background=dark
colorscheme gruvbox
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

" Removes trailing spaces
nnoremap <silent><Leader>t :call TrimWhiteSpace()<CR>

" fix <c-h> in neovim
if has('nvim')
  nnoremap <BS> <C-W>h
endif

" Misc functions / auto commands
" ==============================================================================
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
