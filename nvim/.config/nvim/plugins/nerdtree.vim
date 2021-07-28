"""
" Description:
"      Matthijs' (neo)vim NERDTree plugin configuration file
"
" Package:
"       preservim/nerdtree
"
" Maintainer:
"      Matthijs Padding — @mppadding
"
" Version:
"     V0.01 - 26/07/2021
"""

" Map Space-F to open NERDTree
nnoremap <Leader>f :NERDTree<CR>

" Close nerdtree after opening a file
let NERDTreeQuitOnOpen = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
