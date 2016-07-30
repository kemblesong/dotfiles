" NEOVIM CONFIGURATION
" ~/.config/nvim/init.vim
" Kemble Song <kemblesong>
" ===============================================================================

" Map the leader key to space
let g:mapleader = "\<Space>"
" Enable glorious 24bit true color
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Plugins
" ===============================================================================
call plug#begin()

Plug 'mhinz/vim-startify'

Plug 'w0ng/vim-hybrid'
  let g:hybrid_custom_term_colors = 1
  let g:hybrid_reduced_contrast = 1
Plug 'cocopon/lightline-hybrid.vim'

Plug 'itchyny/lightline.vim'
  let g:lightline = {
        \ 'colorscheme': 'hybrid',
        \ 'mode_map' : {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'V',
        \ "\<C-v>": 'V',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'S',
        \ "\<C-s>": 'S',
        \ 't': 'T',
        \ '?': '' },
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'fugitive', 'filename', 'whitespace' ] ]
        \ },
        \ 'component_function': {
        \   'fugitive': 'LightLineFugitive',
        \   'readonly': 'LightLineReadonly',
        \   'modified': 'LightLineModified',
        \   'filename': 'LightLineFilename',
        \   'whitespace': 'TrailingSpaceWarning'
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

  function! TrailingSpaceWarning()
    if !exists("b:statline_trailing_space_warning")
      let lineno = search('\s$', 'nw')
      if lineno != 0
        let b:statline_trailing_space_warning = '[trailing:'.lineno.']'
      else
        let b:statline_trailing_space_warning = ''
      endif
    endif
    return b:statline_trailing_space_warning
  endfunction

Plug 'jszakmeister/vim-togglecursor'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/deoplete.nvim'
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif 

Plug 'neomake/neomake'
  autocmd! BufWritePost * Neomake

Plug 'craigemery/vim-autotag'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_nvim_statusline = 0
  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>; :Tags<CR>
  nnoremap <silent> <leader>. :Lines<CR>
  nnoremap <silent> <leader>/ :Ag<CR>
  let $FZF_DEFAULT_OPTS='--color=bw'

Plug 'tpope/vim-fugitive'
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit<CR>

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

Plug 'ap/vim-css-color', { 'for': ['html', 'scss', 'css'] }

Plug 'mattn/emmet-vim', { 'for': ['html', 'scss', 'css', 'js', 'jsx'] }
  let g:user_emmet_leader_key = '<C-E>'

Plug 'junegunn/goyo.vim'
  nnoremap <leader>df :Goyo<CR>

Plug 'tpope/vim-surround'

Plug 'christoomey/vim-tmux-navigator'

Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['haxe']

Plug 'jdonaldson/vaxe', { 'for': 'haxe' }

Plug 'leafo/moonscript-vim', { 'for': 'moon' }

Plug 'racer-rust/vim-racer', { 'for': 'rust' }
  let g:racer_cmd = "~/.cargo/bin/racer"

Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

Plug 'mileszs/ack.vim'
  if executable('ag')
    let g:ackprg = 'ag --vimgrep'
  endif

call plug#end()

" Syntax / Filetype things
" ==============================================================================
" Go
autocmd FileType go setlocal shiftwidth=4 tabstop=4
" Rust
let g:rustfmt_autosave = 1

" UI
" ==============================================================================
set background=dark
colorscheme hybrid
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

" recalculate when idle, and after saving
augroup statline_trail
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END
