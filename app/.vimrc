""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Functions                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:EatChar(pattern)
  let c = nr2char(getchar(0))

  return (c =~ a:pattern) ? '' : c
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Appearance
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Cursors
if &term =~ 'xterm'
  let &t_EI = "\<Esc>[2 q"
  let &t_SI = "\<Esc>[5 q"
  let &t_SR = "\<Esc>[1 q"
endif

" Colors
syntax on
colorscheme badwolf

" Visual elements
set number relativenumber laststatus=2 cursorline colorcolumn=80
set list listchars=eol:↲,tab:»▸,space:·,trail:•,extends:›,precedes:‹,nbsp:␣
set hlsearch incsearch
nohlsearch

" Status line
set statusline=%f\ %y\ %m\ %r\ %{FugitiveStatusline()}%=%v\ %l/%L

" Wrapping
set nowrap breakindent textwidth=80 linebreak
let &showbreak = '↪ '

" Indenting
set autoindent softtabstop=2 shiftwidth=2 expandtab
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Behavior                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader
let mapleader = ' '

" Moving between splits
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Resizing splits
noremap <C-e> <C-w>=

" Switching from insert mode to normal mode
inoremap jk <Esc>
inoremap <Esc> <Nop>

" Toggling line numbers
nnoremap <silent><expr> <Leader>n &number == 1 ?
  \ ':set nonumber norelativenumber<CR>' .
  \ ':echo ''nonumber norelativenumber''<CR>' :
  \ ':set number relativenumber<CR>' .
  \ ':echo ''  number   relativenumber''<CR>'

" Toggling  hidden characters
nnoremap <silent><Leader>l :set list! list?<CR>

" Toggling wrapping
nnoremap <silent><expr> <Leader>w &wrap == 1 ?
  \ ':set nowrap<CR>' .
  \ ':echo ''nowrap''<CR>' :
  \ ':set wrap linebreak<CR>' .
  \ ':echo ''  wrap   linebreak''<CR>'

" Turning of highlighting for current search
nnoremap <silent> <Leader><Space> :nohlsearch<CR>

" Sourcing files
nnoremap <silent> <Leader>ss :update<CR>
  \:execute 'source ' . expand('%:p')<CR>
  \:echo 'Sourced this file'<CR>

" Editing .vimrc
nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Auto Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Filetype commands
augroup vimscript
  autocmd!
  autocmd Filetype vim nnoremap <buffer> <silent> <Leader>b
    \ :call decorate#DecorateLine('" ', '', '', '', '', '')<CR>
    \O<Esc>
    \:call decorate#DecorateLine('"', '"', '', '')<CR>
    \jo<Esc>
    \:call decorate#DecorateLine('"', '"', '', '')<CR>
  autocmd Filetype vim noremap <buffer> <silent> <Leader>d
    \ :call decorate#DecorateLine('" ', '', '', '', ' ', '', 'l')<CR>
  autocmd Filetype vim nnoremap <buffer> <Leader>c
    \ I" <Esc>
augroup END

augroup shell
  autocmd!
  autocmd Filetype sh,zsh nnoremap <buffer> <silent> <Leader>b
    \ :call decorate#DecorateLine('# ', '', '', '', '', '')<CR>
    \O<Esc>
    \:call decorate#DecorateLine('#', '#', '', '')<CR>
    \jo<Esc>
    \:call decorate#DecorateLine('#', '#', '', '')<CR>
  autocmd Filetype sh,zsh noremap <buffer> <silent> <Leader>d
    \ :call decorate#DecorateLine('# ', '', '', '', ' ', '', 'l')<CR>
  autocmd Filetype sh,zsh nnoremap <buffer> <Leader>c
    \ I# <Esc>
augroup END

augroup javascript
  autocmd!
  autocmd Filetype javascript nnoremap <buffer> <silent> <Leader>b
    \ :let b:indentExpr = &indentexpr<CR>
    \:set indentexpr=<CR>
    \:call decorate#DecorateLine('// ', '', '', '', '', '')<CR>
    \O<Esc>
    \:call decorate#DecorateLine('//', '//', '', '')<CR>
    \jo<Esc>
    \:call decorate#DecorateLine('//', '//', '', '')<CR>
    \:execute 'set indentexpr=' . b:indentExpr<CR>
  autocmd Filetype javascript noremap <buffer> <silent> <Leader>d
    \ :call decorate#DecorateLine('// ', '', '', '', ' ', '', 'l')<CR>
  autocmd Filetype javascript nnoremap <buffer> <Leader>c
    \ I// <Esc>
  autocmd Filetype javascript inoreabbrev iff
    \ if ()<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev eii
    \ <BS><Down><Esc>A else if ()<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev ell
    \ <BS><Down><Esc>A else {<CR>}<Esc>O<C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev foo
    \ for ()<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev whh
    \ while ()<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev doo
    \ do {<CR>} while()<Esc>O<Tab><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev sww
    \ switch ()<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev caa
    \ case :<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev dee
    \ default:<CR><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev ree
    \ return;<Left><C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev brr
    \ break;<C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev coo
    \ continue;<C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev jb
    \ <BS><Esc>A {<CR>}<Esc>O<C-r>=<SID>EatChar('\s')<CR>
  autocmd Filetype javascript inoreabbrev jo
    \ <BS><Down><Esc>o<C-r>=<SID>EatChar('\s')<CR>
augroup END
