" set python version to 3.7
set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/Current/Python

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
Plug 'davidhalter/jedi-vim', { 'for': ['python'] }
Plug 'tell-k/vim-autopep8', { 'for': ['python'] }
Plug 'ycm-core/YouCompleteMe', { 'for': ['h', 'c', 'cpp', 'cc', 'cuda', 'go'], 'do': './install.py --clang-completer --clangd-completer --go-completer' }
Plug 'mtdl9/vim-log-highlighting', { 'for': 'log' }
Plug 'chrisbra/csv.vim', { 'for': 'csv' }

Plug 'scrooloose/syntastic'
Plug 'pearofducks/ansible-vim'
Plug 'altercation/vim-colors-solarized'
" vim fugitive && :Gbrowse
Plug 'tpope/vim-fugitive' | Plug 'tpope/vim-rhubarb' | Plug 'shumphrey/fugitive-gitlab.vim'
" vim snippets
Plug 'ervandew/supertab'
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
set ttymouse=
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
set ttyfast
set lazyredraw
set complete-=i
set display+=lastline


""""""""""""""
"" Mappings ""
""""""""""""""
let mapleader = ";"
set pastetoggle=<F12>

" buffer & tab
nmap K :bn<cr>
nmap J :bp<cr>

nmap <leader>] :tabn<cr>
nmap <leader>[ :tabp<cr>

nmap VV ggVG
map <C-c> "+y



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

" Vagrantfile
autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
" Dockerfile
autocmd BufRead,BufNewFile [Dd]ockerfile set ft=Dockerfile
autocmd BufRead,BufNewFile Dockerfile* set ft=Dockerfile
autocmd BufRead,BufNewFile *.[Dd]ockerfile set ft=Dockerfile
" vim
autocmd BufRead,BufNewFile *.vim set ft=vim



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
nmap <C-p> :CtrlP<CR>

" nerd tree
let NERDTreeWinPos = "left"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\.class$']
nmap <leader>n :NERDTreeToggle<CR>

" jedi
" jedi-vim
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>u"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "2"
" Load rope plugin
let g:pymode_rope = 0


" syntastic
" :SyntasticCheck
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_aggregate_errors = 1
let g:syntastic_cursor_column = 0
let g:syntastic_echo_current_error = 0
" :SyntasticToggleMode
let g:syntastic_mode_map = { "mode": "passive" }
" Checkers
let g:syntastic_python_flake8_args='--max-line-length=120'
let g:syntastic_python_pylint_args='--errors-only'
let g:syntastic_go_checkers = ['go', 'gofmt']
let g:syntastic_c_checkers = ['checkpatch', 'gcc', 'clang']
let g:syntastic_c_checkpatch_exec = '$HOME/.vim/own-scripts/checkpatch.pl'

" golang
let g:go_version_warning = 0

" vikube
let g:vikube_autoupdate = 1
let g:vikube_default_logs_tail = 500
let g:vikube_use_current_namespace = 1
let g:vikube_disable_custom_highlight = 1

" fugitive && :Gbrowse
let g:fugitive_gitlab_domains = ['https://gitlab.4pd.io/']

" tagbar
nmap <leader>m :TagbarToggle<CR>
" ranger
nmap <leader>f :Ranger<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" ycm
let g:ycm_filetype_whitelist = {'h': 1, 'c':1, 'cpp':1, 'cc':1, 'go':1}
let g:ycm_server_keep_logfiles = 0
let g:ycm_server_log_level = 'error'
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/own-scripts/ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
au FileType c,cpp,h,cc,go nmap <leader>g :YcmCompleter GoToDeclaration<CR>
au FileType c,cpp,h,cc,go nmap <leader>u :YcmCompleter GoToReferences<CR>
au FileType c,cpp,h,cc,go nmap <leader>d :YcmCompleter GetDoc<CR>
au FileType c,cpp,h,cc,go nmap <leader>t :YcmCompleter GetType<CR>
au FileType c,cpp,h,cc,go nmap <leader>r :YcmCompleter RefactorRename<CR>


" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<Right>"
let g:UltiSnipsJumpBackwardTrigger = "<Left>"
