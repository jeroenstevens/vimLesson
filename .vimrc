"Settings
"General stuff
let mapleader = " "
set nocp
execute pathogen#infect()
set encoding=utf-8
filetype plugin indent on
"set guifont=Menlo\ Regular:h22

"Syntax highlighting
syntax on

"Searching
set hlsearch
set incsearch

"No annoying swap files!
set noswapfile

"Whitespace
"Show trailing whitespace
set list
set listchars=eol:¬,trail:·
hi SpecialKey ctermfg=8

"Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Tabsettings
set softtabstop=2 shiftwidth=2 expandtab

"Line numbers
set number

"Commands
"Save/Escape commands
imap jk <Esc>mm:w<Enter>`m
cmap W w !sudo tee %
imap jj <Esc>

"Cursor Navigation
noremap H ^
noremap L $
noremap <c-j> 10j
noremap <c-k> 10k
