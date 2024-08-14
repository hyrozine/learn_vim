set nu
set pastetoggle=<F2>
set hlsearch
set autoindent

nnoremap <F3> :colorscheme iceberg<cr>

let mapleader=';'

inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>q <Esc>:q<cr>
nnoremap <leader>q :q<cr>

inoremap jj <Esc>

" change between buffers
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> [n :bnext<cr>

" change between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" json format
com! FormatJSON %!python3 -m json.tool

