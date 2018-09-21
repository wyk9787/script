" Don't try to be vi compatible
set nocompatible

" remap ESC to jj i 3
imap jj <Esc>

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
let mapleader = "\<Space>"

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set nowrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=5
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1

" Copy to the system clipboard for Mac
set clipboard=unnamed

" NERDTree Shortcut to Ctrl+\
map <C-\> :NERDTreeToggle<CR>

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Set clang_library for auto-completion
let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Cool status bar
Plug 'itchyny/lightline.vim'

" File tree view NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Syntax checking
Plug 'neomake/neomake'

" Comments
Plug 'https://github.com/tpope/vim-commentary.git'

" Smart Indentation
Plug 'https://github.com/vim-scripts/IndentAnything.git'

" Match maker
Plug 'https://github.com/qstrahl/vim-matchmaker.git'

" C/C++ Auto Completion
Plug 'https://github.com/Rip-Rip/clang_complete.git'

call plug#end()

" Settings for neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
