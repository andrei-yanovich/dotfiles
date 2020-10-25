call plug#begin('~/.config/nvim/plugged')

Plug 'haishanh/night-owl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'sgur/vim-editorconfig'

Plug 'airblade/vim-gitgutter' " TODO Read help
Plug 'tpope/vim-fugitive' 

Plug 'terryma/vim-multiple-cursors' " TODO Read help

Plug 'christoomey/vim-tmux-navigator'
Plug 'melonmanchan/vim-tmux-resizer'

" typescript support
Plug 'HerringtonDarkholme/yats.vim'

" js syntax hightlighting
" Plug 'billyvg/tigris.nvim', { 'do': './install.sh' }
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'junegunn/vader.vim'

" linting
Plug 'w0rp/ale'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'chemzqm/denite-extra'

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

set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set splitbelow
set splitright
set number
set numberwidth=1
set hidden
set foldmethod=indent
set foldlevel=99
set nowrap
set nobackup
set nowritebackup
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

" ----------------------------------------------------------------------
"  Loading scripts
"  ---------------------------------------------------------------------
runtime coc.vim
" runtime denite.vim

if has('WSL')
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif

tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

