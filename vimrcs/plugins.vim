"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins.vim
" 主要包含了使用Vundle管理的插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Vundle -- Start
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'               "  插件管理
Plugin 'SirVer/ultisnips'                   "  代码片段
Plugin 'honza/vim-snippets'                 "  代码片段
Plugin 'morhetz/gruvbox'                    "  主题颜色
Plugin 'vim-ruby/vim-ruby'                  "  ruby
Plugin 'tpope/vim-rails'                    "  ruby
"Plugin 'tpope/vim-rbenv'                   "  ruby
Plugin 'godlygeek/tabular'                  "  格式对齐
Plugin 'vim-scripts/bash-support.vim'       "  bash插件
Plugin 'vim-scripts/c.vim'                  "  C/C++插件
" Plugin 'fholgado/minibufexpl.vim'
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-pathogen'                 "  插件管理
Plugin 'vim-scripts/commentary.vim'         "  备注
"Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/autoload_cscope.vim'    "  自动加载cs库
Plugin 'vim-scripts/mru.vim'                "  最近使用文件
"Plugin 'vim-scripts/TabLineSet.vim'
Plugin 'vim-scripts/Emmet.vim'              "  HTML网页编辑
Plugin 'vim-scripts/YankRing.vim'           "  复制操作
Plugin 'vim-scripts/Markdown'               "  markdown
Plugin 'vim-scripts/surround.vim'           "  包围文本内容
"Plugin 'vim-scripts/taglist.vim'            "  标签列表
Plugin 'vim-scripts/Syntastic'              "  语法检查
Plugin 'scrooloose/nerdtree'                "  文件目录树
Plugin 'mileszs/ack.vim'                    "  搜索程序
Plugin 'vim-scripts/nerdtree-ack'
Plugin 'kien/ctrlp.vim'                     "  ctrlp 搜索文件
Plugin 'vim-scripts/bufexplorer.zip'        "  <leader>o 打开buffer
Plugin 'junegunn/goyo.vim'                  "  markdown
Plugin 'amix/vim-zenroom2'                  "  markdown
"Plugin 'groenewege/vim-less'               "  css
Plugin 'sophacles/vim-bundle-mako'          "  python
Plugin 'vim-scripts/vim-expand-region'      "  按'+'扩选
Plugin 'vim-scripts/fugitive.vim'           "  Git插件
Plugin 'vim-scripts/vim-indent-object'      "  缩进
Plugin 'bling/vim-airline'                  "  状态栏、标签栏
Plugin 'amix/open_file_under_cursor.vim'    "  按'gf'打开光标下文件
"Plugin 'vim-scripts/tlib'                  "  VIM的一个library，也许有插件依赖于它
"Plugin 'marcweber/vim-addon-mw-utils'      "
Plugin 'vim-scripts/fcitx.vim'              "  退出插入模式时自动切换成英文
Plugin 'majutsushi/tagbar'                  "  大纲式TagList
Plugin 'jez/vim-superman'                   "  Man帮助文档
Plugin 's3rvac/AutoFenc'                    "  自动设定文件编码
"Plugin 'bling/vim-bufferline'               "  显示Buffer

if has("gui_running")
    Plugin 'vim-scripts/vim-multiple-cursors'   "  多光标操作
    " Plugin 'https://github.com/scue/vim-eclim_wrapper.git' " eclim, for java
endif

if has("unix") || has("mac")
    Plugin 'Valloric/YouCompleteMe'         "  YouCompleteMe代码补全插件
elseif has("win16") || has("win32")
    Plugin 'https://github.com/scue/vim-ycm_win7.git' "  YouCompleteMe for win7 x86 & x64
endif

call vundle#end()            " required
filetype plugin indent on    " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       Vundle -- End
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
