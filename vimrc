set nocompatible
filetype off

set runtimepath+=$HOME/.vim/bundle/vundle/
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
Bundle 'plasticboy/vim-markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/Logcat-syntax-highlighter'
Bundle 'majutsushi/tagbar'
Bundle 'francoiscabrol/ranger.vim'

" snipmate
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" auto complete
Bundle 'davidhalter/jedi-vim'
Bundle 'lambdalisue/vim-pyenv'
Bundle 'Valloric/YouCompleteMe'

"" required!
syntax on
set t_Co=256
filetype on
filetype plugin indent on



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
set list tabstop=4 softtabstop=4 shiftwidth=4 expandtab
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

nnoremap <F7> mzgg=G`z
" nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
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
let NERDTreeWinPos = "left"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.class$']
nmap <leader>n :NERDTreeToggle<cr>


" jedi
" jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#use_splits_not_buffers = "left"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>b"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" ycm
let g:ycm_filetype_whitelist = {'c':1, 'cpp':1, 'cc':1, 'go':1}
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
nmap <leader>ji :YcmCompleter GoToInclude<CR>
nmap <leader>b :YcmCompleter GoToDeclaration<CR>
nmap <leader>g :YcmCompleter GoToDefinition<CR>
nmap <leader>jd :YcmCompleter GoTo<CR>
nmap <leader>ji :YcmCompleter GoToImprecise<CR>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>d :YcmCompleter GetDoc<CR>

" syntastic
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol='E>'
let g:syntastic_warning_symbol='W>'
let g:syntastic_aggregate_errors = 1

let g:syntastic_enable_python_checker = 1
let g:syntastic_python_checkers = ['python3', 'flake8']
let g:syntastic_python_flake8_args='--max-line-length=120'
" let g:syntastic_python_flake8_exec='/Users/yu/.pyenv/versions/3.6.1/envs/walley/bin/flake8'

let g:syntastic_enable_go_checker = 1
let g:syntastic_go_checkers = ['go', 'gofmt']

let g:syntastic_enable_c_checker = 1
let g:syntastic_c_checkers = ['checkpatch', 'gcc']
let g:syntastic_c_checkpatch_exec = '$HOME/.vim/syntastic/checkpatch.pl'

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
" hotkey 'gq'
autocmd FileType go setlocal formatprg=gofmt
let g:go_version_warning = 0

" python
" hotkey 'gq'
autocmd FileType python setlocal formatprg='autopep8\ -'

" c Family
autocmd FileType c,c++,cpp,cc setlocal noexpandtab

" nginx
autocmd BufReadPost *.conf if &ft == '' | setfiletype nginx | endif
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

