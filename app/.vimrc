""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursors
if &term =~ "xterm"
    let &t_EI = "\<esc>[2 q"
    let &t_SI = "\<esc>[5 q"
    let &t_SR = "\<esc>[1 q"
endif

" Colors
syntax on
colorscheme badwolf

" Visual elements
set number relativenumber laststatus=2 cursorline colorcolumn=80
set list listchars=eol:↲,tab:»▸,space:·,trail:•,extends:›,precedes:‹,nbsp:␣
set hlsearch incsearch

" Status line
set statusline=%f\ %y\ %m\ %r\ %{FugitiveStatusline()}%=%v\ %l/%L

" Wrapping
set nowrap breakindent
let &showbreak = '↪ '

" Indenting
set autoindent softtabstop=4 shiftwidth=4 expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
let mapleader = " "

" Moving between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Resizing splits
noremap <c-e> <c-w>=

" Switching from insert mode to normal mode
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Toggling line numbers
nnoremap <silent><expr> <leader>n &number == 1 ?
    \ ":set nonumber norelativenumber<cr>" .
    \ ":echo 'nonumber norelativenumber'<cr>" :
    \ ":set number relativenumber<cr>" .
    \ ":echo '  number   relativenumber'<cr>"

" Toggling  hidden characters
nnoremap <silent><leader>l :set list!<cr>
    \ :set list?<cr>

" Toggling wrapping
nnoremap <silent><leader>w :set wrap!<cr>
    \ :set wrap?<cr>

" Turning of highlighting for current search
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Editing and sourcing .vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <leader>sv :update<cr>
    \ :source $MYVIMRC<cr>
    \ :echo "Sourced .vimrc"<cr>

" Sourcing
nnoremap <silent> <leader>ss :update<cr>
    \ :execute 'source ' . expand('%:p')<cr>
    \ :echo "Sourced this file"<cr>

" Decorating
nnoremap <silent> <leader>d :call decorate#DecorateLine('"', ' ')<cr>
