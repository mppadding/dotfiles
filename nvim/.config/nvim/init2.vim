"""
" Description:  NVIM Configuration file
" Author:       Matthijs 'Pukkertje' Padding (https://github.com/pukkertje)
" Version:      V0.01
"""

source ~/.config/nvim/vimrc.vim

"""
" System Changes: Mapped CAPS-LOCK to Escape
"""

"""
" Language:
source ~/.config/nvim/language.vim

"if &listchars ==# 'eol:$'
"    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"endif
set list

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'

let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

let g:airline_theme = 'molokai'
