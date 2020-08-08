"""
" Rust language file
"""

"""
" Configuration
"""

"" Config: enable auto format on save
let g:rustfmt_autosave = 1

"""
" Commands
"""

"" Comment: Generate a normal comment
autocmd FileType rust inoremap ;c       // 

"" Comment: Generate a block comment (3 lines)
autocmd FileType rust inoremap ;bc      /***<Enter><Enter><Backspace>*/<C-\><C-o>k<Space>

"" Comment: Generate a library comment
autocmd FileType rust inoremap ;dc      /// 

"" Output: Print line
autocmd FileType rust inoremap ;pl      println!("");<C-o>h<C-o>h
