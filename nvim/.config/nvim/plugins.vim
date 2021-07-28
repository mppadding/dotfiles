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
" │     ⇒ [b] Gutentags
" │     ⇒ [c] Tagbar
" │     ⇒ [d] Denite
" │     ⇒ [e] NERDTree
" │     ⇒ [f] Snippets
" │
" └────────

source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/gutentags.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/tagbar.vim

"" Rust:
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/var/lib/snapd/snap/bin/universal-ctags',
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
" │ [d] Denite
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
