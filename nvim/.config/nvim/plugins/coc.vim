"""
" Description:
"      Matthijs' (neo)vim CoC plugin configuration file
"
" Package:
"       neoclide/coc.nvim
"
" Maintainer:
"      Matthijs Padding — @mppadding
"
" Version:
"     V0.01 - 26/07/2021
"""

" Extensions Used:
"   - coc-texlab        => LaTeX
"   - coc-rust-analyzer => Rust
"   - coc-python        => Python
"   - coc-json          => JSON
"   - coc-cmake         => CMake
"   - coc-calc          => Calculations
"   - coc-markdownlint  => Markdown Linting
"   - coc-snippets      => Snippets
"
" Install Command: CocInstall coc-texlab coc-rust-analyzer coc-python coc-markdownlint coc-snippets

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-Space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
let g:coc_snippet_next = '<tab>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
