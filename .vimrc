set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim          " 常用的配置文件
source ~/.vim_runtime/vimrcs/plugins.vim        " 管理安装的插件 

try
source ~/.vim_runtime/vimrcs/plugins_config.vim " 汇集插件的配置
catch
endtry


if has("win16") || has("win32")
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
