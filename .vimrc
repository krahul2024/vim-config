" General settings set number            " Show line numbers
set tabstop=4         " Number of spaces that a <Tab> in the file counts for
set softtabstop=4     " Number of spaces to use for each step of (auto)indent
set shiftwidth=4      " Size of an indent
set expandtab         " Use spaces instead of tabs
syntax on             " Enable syntax highlighting
set background=dark   " Use dark background colorscheme
set relativenumber
set mouse=a

" Plugin manager (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'         " Lean & mean status/tabline for Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
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
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'tailwindcss/vim-tailwindcss'
call plug#end()

colorscheme embark

" Coc.nvim configuration
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden = 1                  " Show hidden files
let g:NERDTreeWinSize = 30                    " Set NERDTree window size
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" File navigation and explorer toggle
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :Files<CR>

" NERDTree configuration
let NERDTreeQuitOnOpen = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open files in a new vertical split
let g:NERDTreeCustomOpenArgs = {'file': {'where': 'v', 'keepopen': 1, 'stay': 0}}

" More natural split opening
set splitbelow
set splitright

" Easy split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Create new splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" Automatically close NERDTree if it's the only window left
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Floaterm configuration
" Toggle terminal with leader + t
nnoremap <leader>t :FloatermToggle<CR>
tnoremap <leader>t <C-\><C-n>:FloatermToggle<CR>

" Create a new terminal with leader + n
nnoremap <leader>n :FloatermNew<CR>

" Next terminal with leader + ]
nnoremap <leader>] :FloatermNext<CR>

" Previous terminal with leader + [
nnoremap <leader>[ :FloatermPrev<CR>

" Horizontal split for Floaterm
nnoremap <leader>th :FloatermSplit<CR>

" Vertical split for Floaterm
nnoremap <leader>tv :FloatermVSplit<CR>




" Language specific configurations
" Python
let g:python_highlight_all = 1

" Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" JavaScript and React
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" C/C++
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
