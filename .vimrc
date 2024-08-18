let mapleader = ";"
set nu
set hlsearch
set autoindent
set pastetoggle=<F3>
set ts=4
set sw=4
set et

colorscheme iceberg
set background=dark

inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>q <Esc>:q<cr>
nnoremap <leader>q :q<cr>

inoremap jj <Esc>
inoremap pp <Esc>pa

" change between buffers
nnoremap <silent> [b :bprevious<cr>
nnoremap <silent> [n :bnext<cr>

" change between windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" change to shell
nnoremap <F8> :sh<cr>

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
Plug 'brooth/far.vim'
" Plug 'python-mode/python-mode', {'branch': 'develop' }
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'
" if has('nvim')
" 	Plug 'Shougo/deoplete.nvim, {'do': ':UpdateRemotePlugins'}
" else
" 	Plug 'Shougo/deoplete.nvim'
" 	Plug 'roxma/nvim-yarp'
" 	Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup=1
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" nerdtree
nnoremap <leader>f :NERDTreeFind<cr>
nnoremap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [
	\ '\.git$', '\.hg$\', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '.svn$', '\.swp$',
	\ '\.DS_Store$'. '\.sass-cache$'. '__pycache$', '.egg-info$', '\.ropeproject$',
	\]

" ctrl-p
let g:ctrlp_map = '<c-p>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
			\ 'dir': '/v[\/].(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll|swp|pyc|pyo)$',
			\}
lef g:ctrlp_user_command = 'ag %s -l --nocolor --hidden - g ""'
if executable('ag')
	set grep=ag\ --nogroup\ --nocolor
	let g:ctrlp_user_command = 'ag %s -l --nocolor -f -g ""'
else
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
endif

nmap ss <Plug>(easymotion-s2)

" python-mode
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
" let g:pymode_rope_goto_definition_bind = "<c-[>"
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pylint' ]
let g:pymode_options_max_line_length = 120

" tagbar
nnoremap <leader>t :TagbarToggle<cr>

set updatetime=100
