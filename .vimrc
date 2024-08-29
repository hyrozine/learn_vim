let mapleader = ";"
set nu
set hlsearch
set autoindent
set pastetoggle=<F3>
set ts=2
set sw=2
set et

" colorscheme iceberg
set background=dark

inoremap <leader>w <Esc>:w<cr>
nnoremap <leader>w :w<cr>
inoremap <leader>q <Esc>:q<cr>
nnoremap <leader>q :q<cr>

inoremap jj <Esc>
inoremap <leader>p <Esc>pa

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
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install -all' }
" Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'
Plug 'majutsushi/tagbar'
Plug 'lfv89/vim-interestingwords'
Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'

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

" easymotion 
nmap ss <Plug>(easymotion-s2)

" tagbar
nnoremap <leader>t :TagbarToggle<cr>

" coc.nvim
let g:coc_global_extensions = [
            \ 'coc-json',
            \ 'coc-cmake',
            \ 'coc-pyright',
            \ 'coc-vimlsp',
            \]
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" navigate diagnostics
" use ':CocDiagnostics' to get all diagnostics of current buffer in location
" list
nmap <silent> <leader>1 <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>2 <Plug>(coc-diagnostic-next)
map <leader>wf <Plug>(coc-fix-current)
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <leader> to show documentation in preview window
nnoremap <leader>d :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" " vim-lsp-cxx-highlight 
" hi default link LspCxxHlSymFunction cxxFunction
" hi default link LspCxxHlSymFunctionParameter cxxParameter
" hi default link LspCxxHlSymFileVariableStatic cxxFileVariableStatic
" hi default link LspCxxHlSymStruct cxxStruct
" hi default link LspCxxHlSymStructField cxxStructField
" hi default link LspCxxHlSymFileTypeAlias cxxTypeAlias
" hi default link LspCxxHlSymClassField cxxStructField
" hi default link LspCxxHlSymEnum cxxEnum
" hi default link LspCxxHlSymVariableExtern cxxFileVariableStatic
" hi default link LspCxxHlSymVariable cxxVariable
" hi default link LspCxxHlSymMacro cxxMacro
" hi default link LspCxxHlSymEnumMember cxxEnumMember
" hi default link LspCxxHlSymParameter cxxParameter
" hi default link LspCxxHlSymClass cxxTypeAlias

" configure cmake to make lsp effect in large project 
" use command :Gcmake
" function! s:generate_compile_commands()
"   if empty(glob('CMakeLists.txt'))
"     echo "Can't find CMakeLists.txt"
"     return
"   endif
"   if empty(glob('.vscode'))
"     execute 'silent !mkdir .vscode'
"   endif
"   execute '!cmake -DCMAKE_BUILD_TYPE=debug
"       \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B .vscode'
" endfunction
" command! -nargs=0 Gcmake :call s:generate_compile_commands()
