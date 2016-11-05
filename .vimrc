" plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim
execute pathogen#infect()
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" Syntax highlighting and checks
Plugin 'scrooloose/syntastic'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_python_python_exec='python3'
set statusline+=%#warningmsg$
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_python_checker_args='--ignore=E501,F403,W391'
let g:syntastic_python_flake8_args='--ignore=E501,F403,W391'
" Autocompletion plugins
Plugin 'davidhalter/jedi-vim'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'
" Code formatting and commenting
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/nerdcommenter'
" Themes
Plugin 'sjl/badwolf'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Testing support
Plugin 'JarrodCTaylor/vim-python-test-runner'
Plugin 'janko-m/vim-test'
" Git support
Plugin 'tpope/vim-fugitive'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" File searchers and explorers
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
" Others
Plugin 'sjl/gundo.vim'
Plugin 'ervandew/supertab'
Plugin 'tmhedberg/SimpylFold'
Plugin 'fholgado/minibufexpl.vim'
Plugin '907th/vim-auto-save'
Plugin 'python-rope/ropevim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'takac/vim-spotifysearch'
call vundle#end()
" }}}
" colors {{{
syntax enable
set background=dark
colorscheme zenburn
" }}}
" spaces & tabs {{{
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set expandtab " tabs are spaces
" }}}
" ui config {{{
set number " show line numbers
set relativenumber "show relative line numbers
set showcmd " show command in bottom bar
set cursorline " highligh current line
filetype indent on " load filetype-specific indent files
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight match [{()}]
" }}}
" searching {{{
set incsearch " search as characters are entered
set hlsearch " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" }}}
" folding {{{
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold basend on indent level
" }}}
" copying & pasting {{{
set pastetoggle=<F2>
set clipboard=unnamed
" }}}
" movement {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" disable default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <right>
" highlight last inserted text
nnoremap gV `[v`]
" }}}
" leader-shortcuts {{{
let mapleader="," " leader is comma
" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>
" save session
nnoremap <leader>s :mksession<CR>
" }}}
" ctrlp-settings {{{
let g:ctrlp_match_window = 'bottom, order:ttb'
let g:ctrlp_switch_buffer = 0 
let g:ctrlp_working_path_mode = 0
" }}}
" vim-auto-save settings {{{
let g:auto_save = 1 " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0 " do not save while in insert mode
" }}}
" filetype support {{{
filetype plugin on
filetype indent on
filetype plugin indent on
syntax on
"}}}
" ultisnips config {{{
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab><tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsListSnippets="<c-h>"
" }}}
" ycm config {{{
" let g:ycm_ket_list_select_completion=['<C-n>', '<Down>']
" let g:ycm_ket_list_select_completion=['<C-p>', '<Up>']
" let g:ycm_complete_in_comments = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:SuperTabDefaultCompletionType='<C-n>'
let g:ycm_python_binary_path = '/home/mateuszb/.virtualenv/simple-ifttt-rules/bin/python'
" }}}
" nerdtree config {{{
map <F6> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
let g:NERDTreeIndicatorMapCustom ={ "Modified"  : "✹", "Staged"    : "✚", "Untracked" : "✭", "Renamed"   : "➜", "Unmerged"  : "═", "Deleted"   : "✖", "Dirty"     : "✗", "Clean"     : "✔︎", "Unknown"   : "?" }
" }}}
" tagbar config {{{
nmap <F8> :TagbarToggle<CR>
" }}} 
" vim-autoformat config {{{
nnoremap <F3> :Autoformat<CR>
" }}}
" html plugins config {{{
let g:closetag_filenames = "*.html"
" }}}
" extra scripts {{{
" auto-reload .vimrc
augroup reload_vimrc "{
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
        augroup END " }
" }}}
set modelines=1
" vim:foldmethod=marker:foldlevel=0
