call plug#begin('~/.config/nvim/plugged')

Plug 'haishanh/night-owl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sgur/vim-editorconfig'

" denite
Plug 'Shougo/denite.nvim', {'tag': '2.0'}

Plug 'chemzqm/denite-extra'

Plug 'airblade/vim-gitgutter' " TODO Read help
Plug 'tpope/vim-fugitive' 

Plug 'terryma/vim-multiple-cursors' " TODO Read help

Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'
   
"Plug 'ludovicchabant/vim-gutentags'

" typescript support
Plug 'HerringtonDarkholme/yats.vim'

" linting
Plug 'w0rp/ale'

" autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 4
"Plug 'deoplete-plugins/deoplete-jedi'

" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install --frozen-lockfile'}

" js syntax hightlighting
" Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'junegunn/vader.vim'

call plug#end()

let home = expand('~')

if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme night-owl

" let g:netrw_keepdir=0

hi CursorLine guifg=#ff5874 ctermfg=204 guibg=#011627 ctermbg=233 gui=NONE cterm=NONE

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensins#tabline#formatter = 'jsformatter'

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set splitbelow
set splitright
set number
set numberwidth=1
set hidden
set foldmethod=indent
set foldlevel=99
set nowrap
set cmdheight=2
set shortmess+=c
set signcolumn=yes

let g:editorconfig_root_chdir = 1
let mapleader=" "

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'

"set statusline+=%{gutentags#statusline()}
"let g:gutentags_ctags_exclude = ["*.min.js", "*.min.css", "build", "vendor", ".git", "node_modules", "*.vim/bundle/*"]

" -----------------------------------------------------------------------
" linter setup
" -----------------------------------------------------------------------
 "ale
 "let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
" let g:ale_sign_warning = "?"
" let g:ale_sign_error = "\ufb8a"
let g:ale_echo_msg_format = '%severity%: %s [%linter%]'
let g:ale_fixers = { 
  \ 'javascript': ['eslint'],
  \ 'typescript': [],
\ }
 "\ 'json': ['fixjson'] 

let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'typescript': [],
\}
" let g:ale_javascript_eslint_options = "-c ."
"hi ALEErrorSign ctermbg=NONE ctermfg=197 cterm=bold
"hi ALEError ctermfg=197 ctermbg=NONE
"hi ALEWarningSign ctermbg=NONE ctermfg=220
"hi ALEWarning ctermfg=220 ctermbg=NONE

nnoremap <leader>x :ALEFix<CR>

" -----------------------------------------------------------------------
" coc configuration
" -----------------------------------------------------------------------

"let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
"let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
"let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
"let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" -----------------------------------------------------------------------
" Coc setup
" -----------------------------------------------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <leader>a  :<C-u>CocList actions<cr>
" Manage extensions
" nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>


" -----------------------------------------------------------------------
" custom mappings.
" -----------------------------------------------------------------------
" tabs
map <leader>tt :tabnew .<cr>
map <leader>te :tabedit .<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove<cr>

" buffer mappings.
map <leader>bn :bn<cr>
map <leader>bp :bp<cr>
map <leader>bd :bd<cr>

" editing
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" fix indentation
noremap <leader>ff mzgg=G`z

noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>hl :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" -----------------------------------------------------------------------
" denite configuration
" -----------------------------------------------------------------------
" exec 'source' home . '/.config/nvim/denite.vim'

call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('directory_rec', 'command',
    \ ['find', '-L', ':directory',
    \ '-path', '*/.git/*', '-prune', '-o',
    \ '-path', '*/node_modules/*', '-prune', '-o',
    \ '-type', 'd', '-print'])

call denite#custom#map('insert',
                       \ '<C-j>',
                       \ '<denite:move_to_next_line>',
                       \ 'noremap')
call denite#custom#map('insert',
                       \ '<C-k>',
                       \ '<denite:move_to_previous_line>',
                       \ 'noremap')
 
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
    \ ['git', 'ls-files', '-co', '--exclude-standard'])

nnoremap <Leader>ls :Denite buffer -split=floating -winrow=1<CR>
nnoremap <silent> <C-p> :<C-u>Denite
    \ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`<CR>

call denite#custom#source('grep',
    \ 'converters', ['converter/abbr_word'])

nnoremap <Leader>fc :<C-u>DeniteCursorWord -buffer-name=grep grep:::<CR>
nnoremap <Leader>fwc :<C-u>Denite -path=web.candidate/src -buffer-name=web.candidate grep:::<CR>
nnoremap <Leader>fs :<C-u>Denite -path=server/src -buffer-name=server grep:::<CR>
nnoremap <Leader><S-F> :<C-u>Denite -buffer-name=grep grep:::<CR>
nnoremap <Leader>fr :<C-u>Denite -resume -buffer-name=grep grep:::<CR>
nnoremap <Leader>ft :<C-u>Denite -buffer-name=TODO grep:::'TODO AY'<CR>

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" -----------------------------------------------------------------------
" gitgutter
" -----------------------------------------------------------------------
let g:gitgutter_max_signs = 2000

hi GitGutterAdd guifg=#5fd787 ctermfg=78
hi GitGutterChange guifg=#ffaf00 ctermfg=214
hi GitGutterDelete guifg=#ff005f ctermfg=197
hi GitGutterChangeDelete guifg=#ffaf5f ctermfg=215

nnoremap <leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hp :GitGutterPrevHunk<CR>

" -----------------------------------------------------------------------
" general key map
" -----------------------------------------------------------------------
noremap - dd p
noremap _ k dd p k
"noremap gf :vsplit <cfile><CR>

" nnoremap <Esc> :set hlsearch!<CR>
nnoremap <Esc> :noh<CR>

" terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" navigation
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

function! GetCommitMessage(type)
  let result = substitute(system('git branch | grep \* | cut -d '' '' -f2 | grep -o ""HP-\[0-9\]\\+""'), '[\]\|[[:cntrl:]]', '', 'g')
  call setline(line('.'), getline('.') . a:type . ': ' . result . ' ')
endfunction

nnoremap <leader>fi :call GetCommitMessage('fix')<CR>A
nnoremap <leader>fe :call GetCommitMessage('feat')<CR>A

" -----------------------------------------------------------------------
" exercism tests
" -----------------------------------------------------------------------

function! s:exercism_tests()
  if expand('%:e') == 'vim'
    let testfile = printf('%s/%s.vader', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(testfile)
      echoerr 'File does not exist: '. testfile
      return
    endif
    source %
    execute 'Vader' testfile
  else
    let sourcefile = printf('%s/%s.vim', expand('%:p:h'),
          \ tr(expand('%:p:h:t'), '-', '_'))
    if !filereadable(sourcefile)
      echoerr 'File does not exist: '. sourcefile
      return
    endif
    execute 'source' sourcefile
    Vader
  endif
endfunction

autocmd BufRead *.{vader,vim}
      \ command! -buffer Test call s:exercism_tests()
