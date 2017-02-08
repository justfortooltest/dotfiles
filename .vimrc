" ===
" Base config
" ===

" I suspect you are setting the mapleader after the plugins get loaded
let mapleader = ','
set encoding=utf-8

" 鼠标可以复制到剪贴板
set mouse=v

" 总是显示状态栏
set laststatus=2

" backup and swap file
set backupdir=~/.vim/
set directory=~/.vim/

" backspace
set backspace=indent,eol,start

"line number
set number

" 开启折叠(缩进折叠)
set foldmethod=indent

"" 搜索设置
set hlsearch " 高亮
set incsearch " 即时搜索
set ignorecase "忽略大小写

" Show partial commands in status line and
" Selected characters/lines in visual mode
set showcmd

" 设置tab为4个space
set tabstop=2
set shiftwidth=2
set expandtab

 " yark and paste
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

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

Plugin 'mattn/emmet-vim'

Plugin 'Townk/vim-autoclose'

Plugin 'tpope/vim-surround'

Plugin 'majutsushi/tagbar'

Plugin 'hynek/vim-python-pep8-indent'

Plugin 'suan/vim-instant-markdown'

Plugin 'justinmk/vim-gtfo'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype on

" Vim-Colorshemes

syntax enable
let g:solarized_termcolors=256
set background=dark
colorscheme Tomorrow-Night

" 在状态栏显示行号和列号, 需要放置在设置主题后
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor"

hi User1 ctermbg=0 ctermfg=6
hi User2 ctermbg=0 ctermfg=5
hi User3 ctermbg=0 ctermfg=1
hi User4 ctermbg=0 ctermfg=2
hi User5 ctermbg=0 ctermfg=3

" NERDTree

map <C-e> :NERDTreeToggle<CR>

let g:nerdtree_tabs_open_on_gui_startup=0

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

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"" 个人开发

" noremap <c-h> :tabprevious<cr>
" noremap <c-l> :tabnext<cr>

" for macvim
if has("gui_running")
  set go=aAce  " remove toolbar
  " set guifont=Monaco:h13
  set guifont=Monaco\ for\ Powerline:h13
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

  hi User1 guifg=#eea040 guibg=#222222
  hi User2 guifg=#dd3333 guibg=#222222
  hi User3 guifg=#ff66ff guibg=#222222
  hi User4 guifg=#a0ee40 guibg=#222222
  hi User5 guifg=#eeee40 guibg=#222222
endif

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
