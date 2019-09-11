if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Make sure you use single quotes
set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" Cool status bar
Plug 'itchyny/lightline.vim'

" File tree view NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" Syntax checking
Plug 'neomake/neomake'

" Comments
" <leader>c<space>: Toggle the state of current(selected) lines
Plug 'scrooloose/nerdcommenter'

" Match maker
Plug 'https://github.com/qstrahl/vim-matchmaker.git'

" vim-markdown-preview
" This requires Grip(Github Readme Instant Preview): `brew install grip`
Plug 'https://github.com/JamshedVesuna/vim-markdown-preview'

" Spell Checking
Plug 'xolox/vim-misc'
Plug 'reedes/vim-lexical'

" Google Formatter
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" vim colorschemes
" Use ctrl+F8 to random switch to next color scheme
" Command: NextColorScheme
" Command: PrevColorScheme
" Command: RandomColorScheme
Plug 'xolox/vim-colorscheme-switcher'

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

" remap ESC to jj 
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

call glaive#Install()
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /Users/Garrett/script/google-java-format-1.7-all-deps.jar"

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
au BufRead,BufNewFile *.md setlocal textwidth=80

