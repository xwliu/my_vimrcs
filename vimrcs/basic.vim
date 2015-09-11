"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => F1~F12快捷键
""""""""""""""""""""""""""""""
" F1 Help
" map <F2>  :tabp <CR>
" map <F3>  :tabn <CR>
" map <F4>  :NERDTreeToggle <CR>
" map <F5>  :TlistToggle <CR>
" nmap <F6> :YcmDiags<CR>
" nmap <F7> :setlocal paste!<cr>
" nmap <F8> :YRShow<cr>

""""""""""""""""""""""""""""""
" => F1~F12组合键
""""""""""""""""""""""""""""""
" map <C-F7> :!cscope -Rbkq %:p<CR><Bar>
"             \:cs a cscope.out<CR>
" map <C-F11> :!cscope -Rbkq %:p:h<CR><Bar>
"             \:cs a cscope.out<CR>
" map <C-F8> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q %:p<CR><Bar>
" map <C-F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q %:p:h<CR>

""""""""""""""""""""""""""""""
" => leader组合键
""""""""""""""""""""""""""""""
" ,+
" ,-
" ,gv   ack搜索当前词语
" ,g    ack搜索
" ,cc   ack
" ,co   ack新标签打开
" ,n    ack下一条结果
" ,p    ack上一条结果
" ,r    快捷替换选中内容


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" F7 打开、关闭粘贴模式
""""""""""""""""""""""""""""""
nnoremap <F7> :set invpaste paste?<CR>o
imap <F7> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F7>

""""""""""""""""""""""""""""""
" F2 移动到前一个缓冲区
" F3 移动到下一个缓冲区
" F10 打开、关闭折叠代码
""""""""""""""""""""""""""""""
nnoremap <F2> :bprev<CR>
imap <F2> <C-O>:bprev<CR>
nnoremap <F3> :bnext<CR>
imap <F3> <C-O>:bnext<CR>
nnoremap <F10> zi              " for fold toggle

" 快捷输入括号等
" Map auto complete of (, ", ', [
inoremap `1 {<esc>o}<esc>O
inoremap `2 {}<esc>i
inoremap `3 []<esc>i
inoremap `4 ()<esc>i
inoremap `q ''<esc>i
inoremap `w ""<esc>i
inoremap `e <><esc>i
inoremap `Q ''<esc>i
inoremap `W ""<esc>i
inoremap `E <><esc>i

" fix fish shell
if has("unix")
    set shell=bash
endif

""""""""""""""""""""""""""""""
" mouse setting
""""""""""""""""""""""""""""""
set mousemodel=popup

""""""""""""""""""""""""""""""
" 显示输入字符
""""""""""""""""""""""""""""""
set showcmd

""""""""""""""""""""""""""""""
" 自动切换工作目录
""""""""""""""""""""""""""""""
" set autochdir
" set browsedir=current

""""""""""""""""""""""""""""""
" 中文段落不自动换行
""""""""""""""""""""""""""""""
set wrap nolinebreak nolist

""""""""""""""""""""""""""""""
" 显示行号
""""""""""""""""""""""""""""""
set number

""""""""""""""""""""""""""""""
" 启动提示
""""""""""""""""""""""""""""""
set shortmess=atI

""""""""""""""""""""""""""""""
" vim diff mod
""""""""""""""""""""""""""""""
if &foldmethod == "diff"
    set columns=156
    set lines=34
    set nonumber
    if exists('&binary')
        map <F9> :%!xxd -g 1<CR><Bar>
                \:wincmd w<CR><Bar>
                \:%!xxd -g 1<CR>
    endif
endif

""""""""""""""""""""""""""""""
" vim global cut, copy & paste
""""""""""""""""""""""""""""""
map <leader>gx "+x
map <leader>gy "+y
map <leader>gp "+gP

""""""""""""""""""""""""""""""
" vim alt-1,2,3.. for tabs
""""""""""""""""""""""""""""""
" if has("gui_running")
"     nmap <M-1> 1gt
"     nmap <M-2> 2gt
"     nmap <M-3> 3gt
"     nmap <M-4> 4gt
"     nmap <M-5> 5gt
"     nmap <M-6> 6gt
"     nmap <M-7> 7gt
"     nmap <M-8> 8gt
"     nmap <M-9> 9gt
"     nmap <M-0> :tablast<cr>
"     imap <M-1> <C-O>1gt
"     imap <M-2> <C-O>2gt
"     imap <M-3> <C-O>3gt
"     imap <M-4> <C-O>4gt
"     imap <M-5> <C-O>5gt
"     imap <M-6> <C-O>6gt
"     imap <M-7> <C-O>7gt
"     imap <M-8> <C-O>8gt
"     imap <M-9> <C-O>9gt
"     imap <M-0> <C-O>:tablast<cr>
" endif

""""""""""""""""""""""""""""""
" 设置字体、行列大小
""""""""""""""""""""""""""""""
if has("gui_running")
    if has("unix")
        set guifont=文泉驿等宽微米黑\ 9
    elsei has("win16") || has("win32")
        set guifont=Courier_New:h9:cANSI
    endif
    set columns=136
    set lines=46
else
    set t_Co=256
    set cursorline
endif

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
if ! has("gui_running")
    command W w !sudo tee % > /dev/null
endif

" ,+ ,- 分屏时快捷调整大小
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ColorScheme
colorscheme desert

" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
" 默认VIM内部编码是UTF8
set encoding=utf8
" 终端编码与encoding相同
let &termencoding=&encoding 
" 让VIM按以下顺序检索编码，若不设定则无法使用gbk编码
set fileencodings=ucs-bom,utf-8,utf-16,gbk,gb2312,big5,gb18030,latin1

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" " Linebreak on 500 characters
" set lbr
" set tw=500

set ai "Auto indent
set si "Smart indent
" set wrap "Wrap lines

""""""""""""""""""""""""""""""
" => Visual mode related
" * 往后搜索选择内容
" # 向前搜索选择内容
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack searching and cope displaying
"    requires ack.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ack, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Open MacVim in fullscreen mode
if has("gui_macvim")
    set fuoptions=maxvert,maxhorz
    au GUIEnter * set fullscreen
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%y-%d-%m %H:%M:%S")<cr>
