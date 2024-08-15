let mapleader = ";"
set nu
set hlsearch
set autoindent
set pastetoggle=<F3>

colorscheme iceberg
set background=dark

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

call plug#begin('~/.vim/plugged')

Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'yggdroot/indentline'
Plug 'cocopon/iceberg.vim'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
Plug 'junegunn/fzf.vim'

call plug#end()

nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$\', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '.svn$', '\.swp$',
	\ '\.DS_Store$'. '\.sass-cache$'. '__pycache$', '.egg-info$', '\.ropeproject$',
	\]

let g:ctrlp_map = '<c-p>'

nmap ss <Plug>(easymotion-s2)
