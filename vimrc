colorscheme Tomorrow-Night-Bright
set guifont=Menlo\ Regular:h33
"set lines=35 columns=151
let mapleader=" "

set hidden
set history=100
set nowrap
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
set number
set linebreak
set showbreak=+++
set visualbell
set smartcase
set ignorecase
set softtabstop=4
set smarttab
set ruler
syntax on

nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
filetype indent on
imap <C-l> <esc>$i<right>
imap <C-h> <esc>0i
imap jj <Esc>

