""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursors
if &term =~ 'xterm'
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
"                                   Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
let mapleader = ' '

" Moving between splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Resizing splits
noremap <c-e> <c-w>=

" Switching from insert mode to normal mode
inoremap jk <ESC>
inoremap <esc> <nop>

" Toggling line numbers
nnoremap <silent><expr> <leader>n &number == 1 ?
    \ ':set nonumber norelativenumber<cr>' .
    \ ':echo ''nonumber norelativenumber''<cr>' :
    \ ':set number relativenumber<cr>' .
    \ ':echo ''  number   relativenumber''<cr>'

" Toggling  hidden characters
nnoremap <silent><leader>l :set list! list?<cr>

" Toggling wrapping
nnoremap <silent><expr> <leader>w &wrap == 1 ?
    \ ':set nowrap<cr>' .
    \ ':echo ''nowrap''<cr>' :
    \ ':set wrap linebreak<cr>' .
    \ ':echo ''  wrap   linebreak''<cr>'

" Turning of highlighting for current search
nnoremap <silent> <leader><space> :nohlsearch<cr>

" Sourcing files
nnoremap <silent> <leader>ss :update<cr>
    \:execute 'source ' . expand('%:p')<cr>
    \:echo 'Sourced this file'<cr>

" Editing .vimrc
nnoremap <silent> <leader>ev :vsplit $MYVIMRC<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype commands
augroup vimscript
    autocmd!
    autocmd Filetype vim nnoremap <silent> <leader>b
        \ :call decorate#DecorateLine('" ', '', '', '', '', ' "')<cr>
        \O<esc>
        \:call decorate#DecorateLine('"', '"', '', '')<cr>
        \jo<esc>
        \:call decorate#DecorateLine('"', '"', '', '')<cr>
    autocmd Filetype vim noremap <silent> <leader>d
        \ :call decorate#DecorateLine('" ', '', '', '', ' ', ' "', 'l')<cr>
    autocmd Filetype vim nnoremap <leader>c
        \ I" <esc>
augroup END

augroup javascript
    autocmd!
    autocmd Filetype javascript nnoremap <silent> <leader>b
        \ :call decorate#DecorateLine('//', '', '', '', '', '//')<cr>
        \O<esc>
        \:call decorate#DecorateLine('//', '//', '', '')<cr>
        \jo<esc>
        \:call decorate#DecorateLine('//', '//', '', '')<cr>
    autocmd Filetype javascript noremap <silent> <leader>d
        \ :call decorate#DecorateLine('// ', '', '', '', ' ', ' //', 'l')<cr>
    autocmd Filetype javascript nnoremap <leader>c
        \ I// <esc>
    autocmd Filetype javascript inoreabbrev iff
        \ if ()<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev eii
        \ else if ()<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev ell
        \ else {<cr>}<esc>O<tab><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev foo
        \ for ()<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev whh
        \ while ()<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev doo
        \ do {<cr>} while()<esc>O<tab><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev sww
        \ switch ()<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev caa
        \ <c-d>case :<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev dee
        \ <c-d>default:<cr><tab><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev ree
        \ return;<left><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev brr
        \ break;<c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev coo
        \ continue;<c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev nb
        \ <backspace><esc>A {<cr>}<esc>O<tab><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev ni
        \ <backspace><esc>o<tab><c-r>=EatChar('\s')<cr>
    autocmd Filetype javascript inoreabbrev oo
        \ <backspace><esc>jo<c-r>=EatChar('\s')<cr>
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Functions                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! EatChar(pat)
    let c = nr2char(getchar(0))

    return (c =~ a:pat) ? '' : c
endfunction
