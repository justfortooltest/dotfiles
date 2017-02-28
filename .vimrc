" I suspect you are setting the mapleader after the plugins get loaded
let mapleader = ','
set encoding=utf-8

" 打开文件类型检查
filetype plugin indent on

" 使鼠标选择不进入可视模式，带行号选择
set mouse=v

" highlight current line
set cursorline

" y,p 直接与系统剪贴板交换
set clipboard=unnamed

" 总是显示状态栏
set laststatus=2

" backup and swap file
set backupdir=~/.vim/
set directory=~/.vim/

" backspace
set backspace=indent,eol,start

"line number
set number

"" 搜索设置
set hlsearch " 高亮
set incsearch " 即时搜索
set ignorecase "忽略大小写

" 显示命令补全 First tab will complete to longest string and show the the match list, then second tab will complete to first full match and open the wildmenu.
set wildmenu
set wildmode=longest:list,full

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

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'

Plug 'scrooloose/nerdtree'

Plug 'tomtom/tcomment_vim'

Plug 'Townk/vim-autoclose'

Plug 'mattn/emmet-vim'

" <leader> <leader> j/k/w/s/f
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'

Plug 'majutsushi/tagbar'

Plug 'justinmk/vim-gtfo'

call plug#end()

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

"------------------
"" Useful Functions
"------------------

" easier navigation between split windows Use ctrl-[hjkl] to select the active split!
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

" 在可视模式下显示使用的命令, 必须 set compatible
set showcmd

" Mimic Emacs Line Editing in Insert Mode Only
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi

" for macvim
if has("gui_running")
  set go=aAce  " remove toolbar
  " set guifont=Monaco:h13
  set guifont=Monaco\ for\ Powerline:h13
  set columns=140
  set lines=40
  " status line color
  hi User1 guifg=#eea040 guibg=#222222
  hi User2 guifg=#dd3333 guibg=#222222
  hi User3 guifg=#ff66ff guibg=#222222
  hi User4 guifg=#a0ee40 guibg=#222222
  hi User5 guifg=#eeee40 guibg=#222222
endif

" 清除尾随空格
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
