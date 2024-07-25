" General settings
set number            " Show line numbers
set tabstop=4         " Number of spaces that a <Tab> in the file counts for
set softtabstop=4     " Number of spaces to use for each step of (auto)indent
set shiftwidth=4      " Size of an indent
set expandtab         " Use spaces instead of tabs
syntax on             " Enable syntax highlighting
set background=dark   " Use dark background colorscheme
set relativenumber
set mouse=a
set splitbelow
set splitright

set fillchars+=vert:│
set fillchars=eob:-

" Plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'         " Lean & mean status/tabline for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-python/python-syntax'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'dense-analysis/ale'
Plug 'voldikss/vim-floaterm'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'tailwindcss/vim-tailwindcss'
call plug#end()

let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" Coc.nvim configuration
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeCustomOpenArgs = {'file': {'where': 'v', 'keepopen': 1, 'stay': 0}}

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>

autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Floaterm configuration
nnoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>
nnoremap <leader>n :FloatermNew<CR>
nnoremap <leader>] :FloatermNext<CR>
nnoremap <leader>[ :FloatermPrev<CR>
nnoremap <leader>th :FloatermSplit<CR>
nnoremap <leader>tv :FloatermVSplit<CR>

" Language specific configurations
let g:python_highlight_all = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" ALE (Asynchronous Lint Engine)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'tsserver'],
\   'python': ['flake8', 'pylint'],
\   'go': ['golangci-lint'],
\   'c': ['clang'],
\   'cpp': ['clang'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'python': ['black'],
\   'go': ['gofmt', 'goimports'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format'],
\}

let g:ale_fix_on_save = 1

" Tailwind CSS
let g:tailwindcss_enable = 1
