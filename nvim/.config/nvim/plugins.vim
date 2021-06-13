" ┌────────
" │
" │ Description:
" │     Matthijs' (neo)vim plugin configuration file
" │
" │ Maintainer:
" │     Matthijs Padding — @mppadding
" │
" │ Version:
" │     V0.01 - 22/01/2020
" │
" │ Sections:
" │     ⇒ [a] COC
" │     ⇒ [b] Tagbar
" │     ⇒ [c] Denite
" │     ⇒ [d] NERDTree
" │     ⇒ [e] Snippets
" │
" └────────

" ┌────────
" │ [a] COC
" └────────
" Extensions used:
"   - coc-texlab        => LaTeX
"   - coc-rls           => Rust
"   - coc-python        => Python
"   - coc-json          => JSON
"   - coc-cmake         => CMake
"   - coc-calc          => Calculations
"   - coc-markdownlint  => Markdown Linting
"   - coc-snippets      => Snippets

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
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

" ┌────────
" │ [b] Tagbar
" └────────

" Autoclose on selection
let g:tagbar_autoclose = 1

"" Rust:
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/usr/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

" ┌────────
" │ [c] Denite
" └────────

" Use ripgrep for searching current directory, list all files with --files and
" ignore git
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep for grep
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#option('default', 'split', 'horizontal')
call denite#custom#option('default', 'direction', 'left')

nmap <LEADER>b :Denite buffer<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

" ┌────────
" │ [d] NERDTree
" └────────

" Map Space-F to open NERDTree
nnoremap <Leader>f :NERDTree<CR>

" Close nerdtree after opening a file
let NERDTreeQuitOnOpen = 1

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ┌────────
" │ [e] Snippets
" └────────

let g:snips_author = 'Matthijs Padding'
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
