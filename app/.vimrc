" Map leader
let mapleader = " "

" Map switching from insert mode to normal mode 
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Map editing and sourcing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Map nohlsearch
nnoremap <C-l> :nohlsearch<CR><C-l>

" Map removing trailing whitespaces from file
nnoremap <leader>ds :%s/\s\+$//e<cr>

" Set colorscheme
set t_Co=256
colorscheme badwolf

" Set cursors
"   Cursor types
"       0 -> Vertical Bar - Blinking
"       1 -> Block - Blinking
"       2 -> Block
"       3 -> Underscore - Blinking
"       4 -> Underscore
"       5 -> Vertical Bar - Blinking
"       6 -> Vertical Bar
let &t_SI = "\<Esc>]12;white\x7"
let &t_SI .= "\<Esc>[5 q"
let &t_SR = "\<Esc>[1 q"
let &t_EI = "\<Esc>]12;#0a9dff\x7"
let &t_EI .= "\<Esc>[2 q"
set cursorline
set hlsearch

" Reset cursor when vim exits
augroup reset_cursor
    autocmd!
    autocmd VimLeave * silent !echo -e -n "\x1b[\x35 q"
augroup END

" Set options for invisible characters and wrapping
set listchars=eol:↲,tab:»▸,space:·,trail:•,extends:›,precedes:‹,nbsp:␣
set breakindent
let &showbreak = '↪ '

" Set options by filetype
augroup file_group_1
    autocmd!
    autocmd Filetype sh,shell,vim setlocal relativenumber colorcolumn=81 list
        \ nowrap autoindent softtabstop=4 shiftwidth=4 expandtab
augroup END
