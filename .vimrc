"Notice , there only in Mac


" Base config
" I suspect you are setting the mapleader after the plugins get loaded
let mapleader = ','
set encoding=utf-8

" 鼠标可以复制到剪贴板
set mouse=v

" backup and swap file
set backupdir=~/.vim/
set directory=~/.vim/

" backspace
set backspace=indent,eol,start

"line number
set number

" 开启折叠(缩进折叠)
set foldmethod=indent

" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
"设置搜索时忽略大小写
set ignorecase

" Show partial commands in status line and
" Selected characters/lines in visual mode
set showcmd

" 设置tab为4个space
set tabstop=2
set shiftwidth=2
set expandtab

set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

Plugin 'scrooloose/nerdtree'

Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tomtom/tcomment_vim'

Plugin 'Shougo/neocomplete.vim'

Plugin 'Shougo/neosnippet.vim'

Plugin 'Shougo/neosnippet-snippets'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'mattn/emmet-vim'

Plugin 'Townk/vim-autoclose'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'tpope/vim-surround'

Plugin 'majutsushi/tagbar'

Plugin 'rking/ag.vim'

Plugin 'scrooloose/syntastic'

Plugin 'hynek/vim-python-pep8-indent'

Plugin 'fatih/vim-go'

Plugin 'suan/vim-instant-markdown'

Plugin 'justinmk/vim-gtfo'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype on
" To ignore plugin indent changes, instead use:
"
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" All Plugin config


" Neocomplete
"
" 手动打开默认快捷键是 C-x C-o
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" Neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


" AIRLINE

set laststatus=2

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" enable tabline
let g:airline#extensions#tabline#enabled = 1
" set left separator
let g:airline#extensions#tabline#left_sep = ' '
" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme='tomorrow'

" Vim-Colorshemes

syntax enable

colorscheme Tomorrow-Night

" NERDTree

map <C-e> :NERDTreeToggle<CR>

let g:nerdtree_tabs_open_on_gui_startup=0

" Ctrlp

" keymap
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" config
" r - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
" a - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
" 0 or '' (empty string) - disable this feature.

let g:ctrlp_working_path_mode = 'ra'


" Tagbar

nmap <F8> :TagbarToggle<CR>


" Ag

let g:ag_working_path_mode="r"


"" Syntastic
"" 如果想要检测对应语法, 安装相关语法检测工具,例如 python pep8 ,sudo port install py27-
"" flake8

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"不检查html文件
let g:syntastic_html_checkers=['']


"------------------
"" Useful Functions
"------------------
"" easier navigation between split windows
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" redraws the screen and removes any search highlighting.
nmap <silent> <leader>c :nohl<CR>

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %
"=
" " Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" for macvim
if has("gui_running")
  set go=aAce  " remove toolbar
  "set transparency=30
  " set guifont=Monaco:h13
  "
  set background=light
  colorscheme Solarized

  set guifont=Monaco\ for\ Powerline:h13
  set showtabline=2
  set columns=140
  set lines=40
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
  map <D-0> :tablast<CR>
endif


"" 个人开发

" noremap <c-h> :tabprevious<cr>
" noremap <c-l> :tabnext<cr>

""" 清除尾随空格
fun! TrimWhitespace()
  let l:save_cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:save_cursor)
endfun

au BufWritePre * :call TrimWhitespace()
" au BufWritePre * normal gg=G
au BufRead,BufNewFile *.vue set filetype=html
autocmd BufNewFile,BufRead *.json set ft=javascript

"在.zshrc中加入 stty stop undef, ctrl + s变为保存
noremap <silent> <C-S> :update<CR>
