
"set lines=35 columns=150
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
set spell
syntax on
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
nnoremap <Leader><Leader> :e#<CR>
filetype indent on
:imap jj <Esc>

