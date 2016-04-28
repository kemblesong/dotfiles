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

"Plug 'NLKNguyen/papercolor-theme'
"Plug 'morhetz/gruvbox'
"Plug 'chriskempson/base16-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_powerline_fonts = 1
  let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V',
      \ '' : 'V',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ 't' : 'T',
      \ }

Plug 'jszakmeister/vim-togglecursor'

Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_nvim_statusline = 0
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>. :Lines<CR>

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'css'] }

Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
  let g:jsx_ext_required = 0

Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key = '<C-E>'

Plug 'junegunn/goyo.vim'
  nnoremap <leader>df :Goyo<CR>

Plug 'tpope/vim-surround'

Plug 'elixir-lang/vim-elixir', { 'for': [ 'elixir', 'eelixir' ] }

Plug 'ElmCast/elm-vim', { 'for': 'elm' }
  let g:elm_setup_keybindings = 0

Plug 'raichoo/purescript-vim', { 'for': 'purescript' }

Plug 'dag/vim-fish', { 'for': 'fish' }

Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" UI
" ==============================================================================
"if strftime("%H") > 6 && strftime("%H") < 18
"  set background=light
"  let $FZF_DEFAULT_OPTS='--color bw'
"else
"  set background=dark
let $FZF_DEFAULT_OPTS='--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254,info:254,prompt:37,spinner:108,pointer:235,marker:235'
"endif
set background=dark
colorscheme solarized
set number              " Show line numbers
set relativenumber      " Set relative line numbers as default
set cursorline          " Highlight cursor line
set showmatch           " Show matching brackets
set showcmd             " Show command
set ruler               " Show line positions
set visualbell          " don't beep
set noerrorbells        " don't beep
set laststatus=2        " don't show last status
set noshowmode          " Don't show mode
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

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
nnoremap <silent><Leader>t :call TrimWhiteSpace()<CR>

if has('nvim')
  " fix <c-h> in neovim
  nnoremap <BS> <C-W>h
endif
