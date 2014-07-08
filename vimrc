set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
"" required!
Bundle 'gmarik/vundle'


"""""""""""""
"" Bundles ""
"""""""""""""
" vim-scripts
Bundle "The-NERD-tree"
Bundle "genutils"
Bundle "L9"

" github
Bundle "plasticboy/vim-markdown"
Bundle "kien/ctrlp.vim"
Bundle 'bling/vim-airline'
Bundle "tpope/vim-fugitive"

" snipmate
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'

" golang
Bundle "jnwhiteh/vim-golang"
set runtimepath+=$GOROOT/misc/vim

"" required!
syntax on
set t_Co=256
filetype plugin on
filetype indent on



""""""""""""""
"" Settings ""
""""""""""""""
try
    colorscheme desert
catch
endtry

set number
set showcmd showmatch noshowmode
set lazyredraw
set hidden
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set incsearch hlsearch
set smartcase
set magic lbr
set nobackup nowb
set autoindent smartindent cindent
set wildmenu
set fdl=3
set formatoptions+=mM
set ts=4 sts=4 sw=4 noexpandtab
set vb t_vb=
set background=dark
set history=400  " vim default save 20 histories
set autoread     " when file is modified outside vim, auto reload
set mouse=
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,utf-16le,utf-16be,ucs-bom,latin1
set listchars=tab:▸\ ,eol:¬
set completeopt+=longest
set laststatus=2 " show status line



""""""""""""""
"" Mappings ""
""""""""""""""
let mapleader = ";"

" buffer & tab
nmap <leader>] :bn<cr>
nmap <leader>[ :bp<cr>

nmap <leader>'] :tabnext<cr>
nmap <leader>'[ :tabprevious<cr>

" Bash(Emacs) key binding
map <C-e> <END>
map <C-a> <HOME>

" quick fix
"nmap <leader>cw :cw<cr>
"nmap <F2> :cn<cr>
"nmap <S-F2> :cp<cr>


"""""""""""""
"" Plugins ""
"""""""""""""
" vundle
let g:vundle_default_git_proto = 'git'

" airline
let g:airline_theme = 'jellybeans'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|CVS$\|\.svn$\|target$',
    \ 'file': '\.class$\|\.so$|\.pyc$|\.swp$',
    \ }
let g:ctrlp_extensions = ['dir', 'mixed']

" nerd tree
let NERDTreeWinPos = "right"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.class$']
nmap <leader>n :NERDTreeToggle<cr>



"""""""""""""""
"" file type ""
"""""""""""""""
" scheme
autocmd BufReadPost *.rkt,*.rktl setlocal filetype=scheme
autocmd FileType scheme setlocal sw=2 expandtab

" golang
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" python
autocmd FileType python setlocal expandtab list
