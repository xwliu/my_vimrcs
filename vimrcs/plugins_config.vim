" 设定主题样式
colorscheme gruvbox


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YankRing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F8 显示剪切板内容
nnoremap <F8> :YRShow<CR>
imap <F8> <C-O>:YRShow<CR>
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files=0

let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20

" ctrlp忽略哪些文件
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ 'file': '\v\.(exe|so|dll)$',
	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	\ }

" ctrlp查找文件命令
let g:ctrlp_user_command = {
	\ 'types': {
		\ 1: ['.git', 'cd %s && git ls-files'],
		\ 2: ['.svn', 'cd %s && svn ls -R .'],
		\ 3: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
	\ 'fallback': 'find %s -type f'
	\ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ZenCoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate (beside <TAB> support <CTRL-j>)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F4> :NERDTreeToggle <CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_next_key="\<C-s>"
let g:multi_cursor_prev_key="\<C-p>"
let g:multi_cursor_skip_key="\<C-x>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme="luna"
" 使用airline来显示Buffer，很美观
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_python_checkers=['pyflakes']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-F8> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q %:p<CR><Bar>
" C-F9 had map to build & run
map <C-F10> :!~/.vim_runtime/plugin_linux/ctags/ctags_with_deps.sh %:p<CR><Bar>
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+ialS --extra=+q %:p:h<CR>
map <leader>t <C-t>
map <leader>g <C-]>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"
" cscope 使用方法：
" -R: 在生成索引文件时，搜索子目录树中的代码
" -b: 只生成索引文件，不进入cscope的界面
" -q: 生成cscope.in.out和cscope.po.out文件，加快索引
" -k: 在生成索引文件时，不搜索/usr/include目录
" -i: 保存文件列表的文件名不是cscope.files时需此项，可使用“-”
" -I dir: 在-I选项指出的目录中查找头文件
" -u: 扫描所有文件，重新生成交叉索引文件
" -C: 在搜索时忽略大小写
" -P path: 在以相对路径表示的文件前加上的path，
"          可不切换至数据库文件所在目录亦可使用
"
" cscope find的用法:
" cs find c|d|e|f|g|i|s|t name
" 0 或 s    查找本 C 符号(可以跳过注释)
" 1 或 g    查找本定义
" 2 或 d    查找本函数调用的函数
" 3 或 c    查找调用本函数的函数
" 4 或 t    查找本字符串
" 6 或 e    查找本 egrep 模式
" 7 或 f    查找本文件
" 8 或 i    查找包含本文件的文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    if has("unix")
        set cscopeprg=/usr/bin/cscope
        map <C-F7> :!cscope -Rbkq %:p<CR><Bar>
                    \:cs a cscope.out<CR>
    elsei has("win16") || has("win32")
        set cscopeprg=~/.vim_runtime/plugins_win/cscope/cscope.exe
        let cscopeprg="~/.vim_runtime/plugins_win/cscope/cscope.exe"
        let findprg="~/.vim_runtime/plugins_win/cscope/find.exe"
        nmap <C-F11> :chdir %:p:h<CR>
                  \:exec "!"expand(cscopeprg)" -Rbk"<CR>
                  \:cs a cscope.out<CR>
    endif
    set cscopetag        " 使用<C-]>进行跳转
    set cscopetagorder=1 " :cscope find g foo,然后:tselect foo
    set nocscopeverbose  " 添加数据库时不显示详细信息
    set cscopeverbose    " 添加数据库时显示详细信息
    " C-C
    nmap <C-C>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-C>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-C>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-C>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-C>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-C>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-C>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-C>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :TagbarToggle <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf='~/.vim_runtime/.ycm_extra_conf.py'
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion = 1
" C-O for go back
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>ji :YcmCompleter GoToImplementationElseDeclaration<CR>
nmap <F6> :YcmDiags<CR>
let g:ycm_seed_identifiers_with_syntax = 1
" java
let g:EclimCompletionMethod = 'omnifunc'
" for all
let g:ycm_filetype_blacklist = {}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<leader>s"
let g:UltiSnipsJumpForwardTrigger="<leader>n"
let g:UltiSnipsJumpBackwardTrigger="<leader>b"
let g:UltiSnipsSnippetsDir='~/.vim_runtime/snippets_scue'
map <leader>e :exec ":UltiSnipsEdit ".expand(&filetype)<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" c-support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:C_GlobalTemplateFile = $HOME.'~/.vim_runtime/conf/c-support/templates/Templates'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby, Ruby on Rails
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" from: https://stackoverflow.com/questions/15723209/better-autocomplete-in-vim
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" from: help ft-ruby-omni
let g:rubycomplete_load_gemfile = 1
let g:rubycomplete_gemfile_path = expand('~/.vim_runtime/Gemfile.scue')
let g:rubycomplete_use_bundler = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnippet settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=[ 'UltiSnips', expand("~/.vim_runtime/snippets_scue")]
autocmd FileType ruby let g:UltiSnipsSnippetDirectories=[expand("~/.vim_runtime/snippets_scue")]
autocmd FileType markdown UltiSnipsAddFiletypes html


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python DOCS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:snips_author = "scue"
let g:snips_email = "scue@vip.qq.com"
let g:snips_github = "github.com/scue"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM SuperMan
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap K :SuperMan <cword><CR>
