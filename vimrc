" automatic installlation
if empty(glob('$HOME/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" required!
set nocompatible
syntax on
set t_Co=256
filetype on
filetype plugin indent on

call plug#begin('$HOME/.vim/plugged')
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Valloric/YouCompleteMe', { 'for': ['c', 'cc', 'cpp', 'h', 'go'], 'frozen': 1 }

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'plasticboy/vim-markdown'
Plug 'pearofducks/ansible-vim'
Plug 'altercation/vim-colors-solarized'
" vim snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" vim airline
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

" vim kubernetes
Plug 'c9s/helper.vim', { 'on': [] }
Plug 'c9s/treemenu.vim', { 'on': [] }
Plug 'c9s/vikube.vim', { 'on': [] }
" :call K8S()
function K8S()
    call plug#load('helper.vim', 'treemenu.vim', 'vikube.vim')
endfunction

Plug 'kien/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'francoiscabrol/ranger.vim', { 'on': 'Ranger' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
call plug#end()



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
set completeopt=longest,menuone,preview
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


"""""""""""""
"" Plugins ""
"""""""""""""
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
nmap <c-p> :CtrlP<CR>

" nerd tree
let NERDTreeWinPos = "left"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.class$']
nmap <leader>n :NERDTreeToggle<CR>


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
let g:ycm_filetype_whitelist = {'h': 1, 'c':1, 'cpp':1, 'cc':1, 'go':1}
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'info'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/own-scripts/ycm_extra_conf.py'
nmap <leader>ji :YcmCompleter GoToInclude<CR>
nmap <leader>b :YcmCompleter GoToDeclaration<CR>
nmap <leader>g :YcmCompleter GoToDefinition<CR>
nmap <leader>jd :YcmCompleter GoTo<CR>
nmap <leader>ji :YcmCompleter GoToImprecise<CR>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>d :YcmCompleter GetDoc<CR>

" syntastic
" :SyntasticCheck
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_aggregate_errors = 1
let g:syntastic_cursor_column = 0
let g:syntastic_echo_current_error = 0
" :SyntasticToggleMode
let g:syntastic_mode_map = { "mode": "passive" }

autocmd FileType python let g:syntastic_enable_python_checker = 1
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_args='--max-line-length=120'

autocmd FileType go let g:syntastic_enable_go_checker = 1
let g:syntastic_go_checkers = ['go', 'gofmt']

autocmd FileType c let g:syntastic_enable_c_checker = 1
let g:syntastic_c_checkers = ['checkpatch', 'gcc']
let g:syntastic_c_checkpatch_exec = '$HOME/.vim/own-scripts/checkpatch.pl'

" tagbar
nmap <leader>m :TagbarToggle<CR>
" ranger
nmap <leader>f :Ranger<CR>



"""""""""""""""
"" file type ""
"""""""""""""""
" c and cpp
autocmd FileType c,cpp,cc,c++ setlocal tabstop=8 softtabstop=8 shiftwidth=0 noexpandtab
autocmd FileType c,cpp,cc,c++ nmap <leader>e :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" golang
" hotkey 'gq'
autocmd FileType go setlocal formatprg=gofmt noexpandtab
autocmd BufReadPost *.go setlocal filetype=go
let g:go_version_warning = 0
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" python
" hotkey 'gq'
autocmd FileType python setlocal formatprg='autopep8\ -'

" vikube
let g:vikube_autoupdate = 1
let g:vikube_default_logs_tail = 500
let g:vikube_use_current_namespace = 1
let g:vikube_disable_custom_highlight = 1

