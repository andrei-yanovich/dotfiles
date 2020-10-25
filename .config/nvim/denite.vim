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
  nnoremap <silent><buffer><expr> <esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#var('file/rec', 'command',
    \ ['scantree.py', "--ignore='node_modules'"])

call denite#custom#var('directory_rec', 'command',
    \ ['find', '-L', ':directory',
    \ '-path', '*/.git/*', '-prune', '-o',
    \ '-path', '*/node_modules/*', '-prune', '-o',
    \ '-type', 'd', '-print'])

" call denite#custom#map('insert',
"                        \ '<C-j>',
"                        \ '<denite:move_to_next_line>',
"                        \ 'noremap')
" call denite#custom#map('insert',
"                        \ '<C-k>',
"                        \ '<denite:move_to_previous_line>',
"                        \ 'noremap')
 
"noremap <C-p> :Denite file_rec<CR>

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <silent> <C-p> :<C-u>Denite
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

nnoremap <Leader>f :Denite -buffer-name=grep grep:::<CR>
nnoremap <Leader>ls :Denite buffer<CR>
" nnoremap <Leader><S-F> :DeniteBufferDir -buffer-name=grep grep:::<CR>

" Ag command on grep source
" call denite#custom#var('grep', 'command', ['ag'])
" call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', [])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
