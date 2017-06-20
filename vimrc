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
Bundle "nginx.vim"

" github
Bundle "justmao945/vim-clang"
Bundle "plasticboy/vim-markdown"
Bundle "kien/ctrlp.vim"
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle "tpope/vim-fugitive"
Bundle 'altercation/vim-colors-solarized'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/Logcat-syntax-highlighter'
Bundle 'ternjs/tern_for_vim'
Bundle 'moll/vim-node'
Bundle 'majutsushi/tagbar'

" snipmate
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'

" golang
Bundle "fatih/vim-go"
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
    colorscheme solarized
    let g:solarized_termcolors=256
    let g:solarized_termtrans = 1
catch
endtry

set title
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
set foldlevel=3
set formatoptions+=mM
set fileformat=unix
set fileformats=unix,dos
set list tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set vb t_vb=
set background=dark
set history=400  " vim default save 20 histories
set autoread     " when file is modified outside vim, auto reload
set mouse=
set encoding=utf8
set fileencodings=utf8,gb2312,gb18030,latin1,utf-16le,utf-16be,iso-8859,ucs-bom
set listchars=trail:.,tab:▸\ ,eol:¬
set completeopt+=longest
set laststatus=2 " show status line
set guioptions-=r
set guioptions-=T
set guioptions-=L
set cursorcolumn
set cursorline


""""""""""""""
"" Mappings ""
""""""""""""""
let mapleader = ";"
set pastetoggle=<F12>

" buffer & tab
nmap <leader>] :bn<cr>
nmap <leader>[ :bp<cr>

nmap <leader>'] :tabnext<cr>
nmap <leader>'[ :tabprevious<cr>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <silent> <C-F12> :TlistToggle<CR>


"""""""""""""
"" Plugins ""
"""""""""""""
" vundle
let g:vundle_default_git_proto = 'git'

" airline
let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '|'
let g:airline_right_sep = '|'

" ctrlp
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|CVS$\|\.svn$\|target$\|node_modules$',
    \ 'file': '\.class$\|\.so$|\.pyc$|\.swp$',
    \ }
let g:ctrlp_extensions = ['dir', 'mixed']

" nerd tree
let NERDTreeWinPos = "right"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.class$']
nmap <leader>n :NERDTreeToggle<cr>

" jedi-vim
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>b"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='E>'
let g:syntastic_warning_symbol='W>'
let g:syntastic_aggregate_errors = 1

let g:syntastic_enable_python_checker = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--max-line-length=120 --ignore=C901'

let g:syntastic_enable_go_checker = 1
let g:syntastic_go_checkers = ['go']

let g:syntastic_enable_c_checker = 1
let g:syntastic_c_checkers = ['checkpatch']
let g:syntastic_c_checkpatch_exec = '/Users/yu/Software/checkpatch.pl'

" tagbar
nmap <leader>t :TagbarToggle<CR>



"""""""""""""""
"" file type ""
"""""""""""""""
" c and cpp
autocmd FileType c,cpp setlocal tabstop=8 softtabstop=8 shiftwidth=0 noexpandtab
" scheme
autocmd BufReadPost *.rkt,*.rktl setlocal filetype=scheme
autocmd FileType scheme setlocal sw=2 expandtab

" golang
autocmd BufReadPost *.go setlocal filetype=go
autocmd FileType go autocmd BufWritePre <buffer> GoImports
autocmd FileType go autocmd BufWritePre <buffer> GoFmt

" python
" hotkey 'gq'
autocmd FileType python setlocal formatprg=autopep8\ -
autocmd FileType python setlocal expandtab

" node
autocmd FileType javascript setlocal expandtab
autocmd FileType javascript nmap <leader>g :TernDef<CR>
autocmd FileType javascript nmap <leader>d :TernDoc<CR>
autocmd FileType javascript nmap <leader>t :TernType<CR>
autocmd FileType javascript nmap <leader>u :TernRefs<CR>
autocmd FileType javascript nmap <leader>r :TernRename<CR>
autocmd FileType javascript inoremap <C-Space> <C-x><C-o>
autocmd FileType javascript inoremap <C-@> <C-x><C-o>

" nginx
autocmd BufReadPost *.conf if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" whitespace lang
autocmd BufReadPost *.ws setlocal filetype=whitespace

" android logcat
autocmd BufReadPost *.logcat setlocal filetype=logcat

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

