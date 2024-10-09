let mapleader = " "
let maplocalleader = " "

set number
set relativenumber
set mouse=a
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set noshowmode
colorscheme habamax
set breakindent
set undofile

" Case-insensitive searching unless capitals are used
set ignorecase
set smartcase

" Keep sign column always on
set signcolumn=yes

" Decrease update time
set updatetime=250

" Decrease mapped sequence wait time
set timeoutlen=300

" Configure new split behavior
set splitright
set splitbelow

" Show whitespace characters
set list
set listchars=tab:»\ ,trail:·,nbsp:␣
set fillchars=eob:-

" Highlight current line
set cursorline
" Minimal number of lines to keep above and below the cursor
set scrolloff=21

nnoremap <Esc> :nohlsearch<CR>
inoremap jj <Esc>
tnoremap <Esc><Esc> <C-\><C-n>
inoremap jj <Esc>



call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'vimlab/split-term.vim'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
call plug#end()

"-------------------- Git Stuff-------------------- 
let g:gitgutter_sign_added = '+'  " Use any symbol you like for added lines
let g:gitgutter_sign_removed = '-'  " Use any symbol for removed lines
let g:gitgutter_sign_modified = '~'  " Use any symbol for modified lines


" ---------------------------------- COC ------------------ 
let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-pyright',
\ 'coc-html',
\ 'coc-css',
\ 'coc-yaml',
\ 'coc-sql',
\ 'coc-go',
\ 'coc-clangd',
\ 'coc-sh',
\ 'coc-eslint',
\ 'coc-prettier'
\]

" Coc error indication settings
highlight CocErrorSign ctermfg=Red guifg=#ff0000
highlight CocWarningSign ctermfg=Yellow guifg=#ffff00
highlight CocInfoSign ctermfg=Blue guifg=#0000ff
highlight CocHintSign ctermfg=Green guifg=#00ff00

" Add status line support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Completion mappings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Manual refresh for completion
inoremap <silent><expr> <c-space> coc#refresh()

" Code navigation and hover actions
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

"-------------------------------------------- Fuzzy Finding------------------ 
function! FzfNoText(command)
    let l:fzf_files_options = '--preview "bat --style=numbers --color=always --line-range :500 {}"'
    let l:options = {
        \ 'options': '--prompt "" ' . l:fzf_files_options
        \ }
    call fzf#run(fzf#wrap(a:command, l:options))
endfunction

nnoremap <leader>ff :call FzfNoText('Files')<CR>
nnoremap <leader>fg :call FzfNoText('Rg')<CR>
nnoremap <leader>fb :call FzfNoText('Buffers')<CR>
nnoremap <leader>fh :call FzfNoText('History')<CR>

""-----------------------------------------NerdTree-----------------------------
let g:NERDTreeShowHidden = 1  " Show hidden files
let g:NERDTreeQuitOnOpen = 1  " Close NERDTree after opening a file
nnoremap <C-n> :NERDTreeToggle<CR>
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"------------------------------------- Status Line ------------------------ 
let g:airline#extensions#tabline#enabled = 1  " Enable tabline
let g:airline#extensions#hunks#enabled = 1   " Enable hunks for git
let g:airline#extensions#branch#enabled = 1  " Show branch name


"--------------------------------------- Auto pair ---------------------------

