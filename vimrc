colorscheme Tomorrow-Night-Bright
set guifont=Menlo Regular:h28
let mapleader=" "

set hidden
set history=100
set nowrap
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch

set showmatch

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>

filetype indent on
:imap jj <Esc>

