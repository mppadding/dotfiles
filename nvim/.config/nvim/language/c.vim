"""
" C commands
"""

" Comment:
autocmd FileType c inoremap ;c  /*  */<C-\><C-o>F*<C-o>h
autocmd FileType c inoremap ;bc /***<Enter><Enter><Backspace>*/<C-\><C-o>k<Space>


" Preprocessor:
autocmd FileType c inoremap #d  #define 
autocmd FileType c inoremap #in #include 
