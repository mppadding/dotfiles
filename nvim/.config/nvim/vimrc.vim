" ┌────────
" │
" │ Description:
" │     Matthijs' (neo)vim configuration file
" │
" │ Maintainer:
" │     Matthijs Padding — @mppadding
" │
" │ Version:
" │     V0.01 - 22/01/2020
" │
" │ Sections:
" │     ⇒ [a] General
" │     ⇒ [b] Interface
" │     ⇒ [c] Colors & Fonts
" │     ⇒ [d] Text, tabs and indent related
" │     ⇒ [e] Helper functions
" │     ⇒ [f] Plugins
" │     ⇒ [g] Mappings
" │
" └────────

" ┌────────
" │ [a] General
" └────────

" How many lines of history does VIM need to remember
set history=500

" More space for the command
set cmdheight=2

" Less noticeable delay
set updatetime=300

" Filetype plugins
filetype plugin indent on

" Autoread when file is changed from outside
set autoread
au FocusGained,BufEnter * checktime

" Mapping leader to <Space>
let mapleader = "\<SPACE>"

" DISABLED: Due to not having an askpass helper or a tty with neovim
" :W sudo-saves the file
" Can be used in case of opening permission-denied files without sudo
" command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" ┌────────
" │ [b] Interface
" └────────

" Show matching brackets:
set showmatch

" Show (relative) line numbers:
set number
set rnu

" Ignore case when searching
set ignorecase

" Do enable smartcase (when uppercase in search force case sensitive)
set smartcase

" Always include the global flag in searches/search-replaces
set gdefault

" Immediately go to next search upon typing
set incsearch

" Dont redraw on macros
set lazyredraw

" Search in all sub folders of working directory
set path+=**

" Display tab completion
set wildmenu

" Always show current position
set ruler

" Set command height to 1
set cmdheight=1

" Dont use vi :)
set nocompatible

" ┌────────
" │ [c] Colors & Fonts
" └────────

" Display a soft-limit on 120 characters
set colorcolumn=120

" Enable syntax highlighting
syntax enable

" Color scheme
set termguicolors
colorscheme monokai

" Always set encoding to UTF-8
set encoding=utf8

" Set unix as standard file type
set ffs=unix,dos,mac

" ┌────────
" │ [d] Text, tabs and indent related
" └────────

" Use spaces instead of tabs
set expandtab

" 1 tab to 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Persistent undo means that you can undo after closing :)
try
    set undodir=~/.config/nvim/tmp/undodir
    set undofile
catch
endtry

" ┌────────
" │ [e] Helper functions
" └────────

" Inputs the current date and time in insert mode
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xtime <C-r>=strftime("%H:%M:%S")<cr>

" ┌────────
" │ [f] Plugins
" └────────

call plug#begin(stdpath('data') . '/plugged')

" VSCode completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"  Vim color scheme
Plug 'crusoexia/vim-monokai'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tag manager
Plug 'ludovicchabant/vim-gutentags'

" Tagbar
Plug 'majutsushi/tagbar'

" Rust
Plug 'rust-lang/rust.vim'

" Display marks
Plug 'kshenoy/vim-signature'

" Nerdtree file manager
Plug 'preservim/nerdtree'

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Yankstack
Plug 'maxbrunsfeld/vim-yankstack'

" Snippets
Plug 'honza/vim-snippets'

call plug#end()

source ~/.config/nvim/plugins.vim

" ┌────────
" │ [g] Mappings
" └────────

" Open tagbar and focus
noremap <Leader>t :TagbarOpen fj<CR>

" Tabbing In Visual
" Indents a selected piece of text
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Go to next placeholder, delete and into insert mode
inoremap ;; <Esc>/<++><Enter>"_c4l

" Line/block movement
" A-j/A-k moves a line up/down.
" A-j/A-k in visual moves the selected block up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
