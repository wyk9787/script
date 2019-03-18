" Make sure you use single quotes
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" Cool status bar
Plugin 'itchyny/lightline.vim'

" File tree view NERDTree
Plugin 'https://github.com/scrooloose/nerdtree.git'

" Syntax checking
Plugin 'neomake/neomake'

" Comments
" <leader>c<space>: Toggle the state of current(selected) lines
Plugin 'scrooloose/nerdcommenter'

" Match maker
Plugin 'https://github.com/qstrahl/vim-matchmaker.git'

" vim-markdown-preview
Plugin 'https://github.com/JamshedVesuna/vim-markdown-preview'

" Spell Checking
Plugin 'xolox/vim-misc'
Plugin 'reedes/vim-lexical'

" Google Formatter
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

" vim colorschemes
" Use ctrl+F8 to random switch to next color scheme
" Command: NextColorScheme
" Command: PrevColorScheme
" Command: RandomColorScheme
Plugin 'xolox/vim-colorscheme-switcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" remap ESC to jj i 3
imap jj <Esc>

" Turn on syntax highlighting
syntax on

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
set textwidth=80
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

" Visualize tabs
set listchars=tab:▸\ 

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Copy to the system clipboard for Mac
set clipboard=unnamed

" NERDTree Shortcut to Ctrl+\
map <C-\> :NERDTreeToggle<CR>

" Settings for neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')

" Use grip to work with vim-markdown-preview plugin to interpret the markdown
" file as a github README file
let vim_markdown_preview_github=1

" Preview markdown on buffer write
" let vim_markdown_preview_toggle=2

" Turn on spell checking
" `z=`: find substitution
" `1z=`: use the first suggestion, without prompting
" `zg`: mark the word as a good word
" `zug`: unmark as good word
" `zw`: mark the word as a bad word
" `zuw`: unmark as bad word
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType text call lexical#init()
augroup END

" Google Code Format
" Those individual formatters need to be installed for each file 
" type to be formatted correctly
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Clang-format's style is specified in ~/.clang-format
  " Using Google Style Guide
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  " YAPF's style is specified in ~/.config/yapf/style
  " Using 2 space instead of 4
  " Using Google Style Guide
  autocmd FileType python AutoFormatBuffer yapf
  "autocmd FileType python AutoFormatBuffer autopep8
augroup END

" Hightlight matches for the word under the cursor on startup
" Prevent matching when the word under the cursor doesn't show up anywhere else
let g:matchmaker_enable_startup = 1
let g:matchmaker_ignore_single_match = 1

" Use leader key to go to different tab quickly
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>h :tabprevious<CR>
noremap <leader>l :tabprevious<CR>

" Since ftplugin is used on default, we have to enforce the indentation
" forspecific language such as Python
autocmd FileType python setlocal shiftwidth=2 softtabstop=2 expandtab
