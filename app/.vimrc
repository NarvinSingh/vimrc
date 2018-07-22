" Leader is space bar
let mapleader = " "     

" Invisible characters and wrapping
set listchars=eol:↲,tab:»▸,space:·,trail:•,extends:›,precedes:‹,nbsp:␣
set breakindent
let &showbreak = '↪ '

" Switching from insert mode to normal mode
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Editing and sourcing vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
