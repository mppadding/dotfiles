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


" Removed options, check if they are still useful
" set path+=**
" set ffs=unix,dos,mac

" Use lua for new options and remove options from this file
" if theyre ported over.
:lua require('modules/options')

" Autoread when file is changed from outside
au FocusGained,BufEnter * checktime

" Mapping leader to <Space>
let mapleader = "\<SPACE>"

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
Plug 'preservim/tagbar'

" Rust
Plug 'rust-lang/rust.vim'

" Display marks
Plug 'kshenoy/vim-signature'

" Nerdtree file manager
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Yankstack
Plug 'maxbrunsfeld/vim-yankstack'

" Snippets
Plug 'honza/vim-snippets'

" telescope.nvim is a highly extendable fuzzy finder over lists
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

let g:NERDTreeGitStatusUseNerdFonts = 1
