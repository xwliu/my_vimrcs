# VIM CONFIG

## INSTALL

基本的可以使用这两行命令先安装

    git clone git@github.com:scue/my_vimrcs.git ~/.vim_runtime
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

安装好了`vundle`之后，打开VIM后就可以使用`PluginInstall`来安装其他插件了


## Linux

Linux相对容易，只需要编辑一个配置文件即可

1.  `~/.vimrc`: `cp ~/.vim_runtime/.vimrc ~/.vimrc`

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

## Windows

Windows相对复杂一些，依赖于Python、Ctags、Git等环境，照着做即可

1.  `_vimrc`: 编辑`C:\Program Files\Vim\_vimrc`

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

2.  `ctags`: 新建一个用户变量`PATH`，设定其值为`%HOMEPATH%\.vim_runtime\plugins_for_me_win\ctags_win`

3.  `~/.bashrc`: 新建一个文本`%HOMEPATH%\.bashrc`，添加以下内容

        function _gmto()
        {
            local cur prev opts
            COMPREPLY=()
            cur="${COMP_WORDS[COMP_CWORD]}"
            prev="${COMP_WORDS[COMP_CWORD-1]}"

            COMPREPLY=( $(compgen -W "$(git branch | sed '/\*/d' | xargs echo)" -- ${cur}) )
            return 0
        }
        case $SHELL in
            '/bin/bash' )
                complete -F _gmto gmto
                ;;
            '/bin/zsh' )
                compdef gmto=git-branch
                ;;
        esac

        # git merge to branch
        gmto(){
            local oldbranch=$(current_branch)
            local mergeto=$1
            git checkout $mergeto
            git merge $oldbranch
            git checkout $oldbranch
        }

        test -e ~/.bash_aliases.git && . ~/.bash_aliases.git

4.  `~/.bash_aliases.git`: 新建一个文本`%HOMEPATH%\.bash_aliases.git`

        __linux_git_complete_file=/usr/share/bash-completion/completions/git
        __windows_git_complete_file=/etc/bash_completion.git
        __host_os_type=$(uname -sm)

        case ${__host_os_type:0:5} in
            Linux)
                __current_git_complete_file=$__linux_git_complete_file
                ;;
            MINGW)
                __current_git_complete_file=$__windows_git_complete_file
                ;;
            *)
                echo "Warning: .bash_alias.git unknow host os type !"
                ;;
        esac

        test -e $__current_git_complete_file && source $__current_git_complete_file

        unset __host_os_type
        unset __linux_git_complete_file
        unset __windows_git_complete_file
        unset __current_git_complete_file

        # Aliases
        alias g='git'
        alias gst='git status'
        alias gd='git diff'
        alias gdc='git diff --cached'
        alias gl='git pull'
        alias gup='git pull --rebase'
        alias gp='git push'
        alias gc='git commit -v'
        alias gc!='git commit -v --amend'
        alias gca='git commit -v -a'
        alias gca!='git commit -v -a --amend'
        alias gcmsg='git commit -m'
        alias gco='git checkout'
        alias gcm='git checkout master'
        alias gr='git remote'
        alias grv='git remote -v'
        alias grmv='git remote rename'
        alias grrm='git remote remove'
        alias grset='git remote set-url'
        alias grup='git remote update'
        alias grbi='git rebase -i'
        alias grbc='git rebase --continue'
        alias grba='git rebase --abort'
        alias gb='git branch'
        alias gba='git branch -a'
        alias gcount='git shortlog -sn'
        alias gcl='git config --list'
        alias gcp='git cherry-pick'
        alias glg='git log --stat --max-count=10'
        alias glgg='git log --graph --max-count=10'
        alias glgga='git log --graph --decorate --all'
        alias glo='git log --oneline --decorate --color'
        alias glog='git log --oneline --decorate --color --graph'
        alias gss='git status -s'
        alias ga='git add'
        alias gm='git merge'
        alias grh='git reset HEAD'
        alias grhh='git reset HEAD --hard'
        alias gclean='git reset --hard && git clean -dfx'
        alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'

        #remove the gf alias
        #alias gf='git ls-files | grep'

        alias gpoat='git push origin --all && git push origin --tags'
        alias gmt='git mergetool --no-prompt'

        alias gg='git gui citool'
        alias gga='git gui citool --amend'
        alias gk='gitk --all --branches'

        alias gsts='git stash show --text'
        alias gsta='git stash'
        alias gstp='git stash pop'
        alias gstd='git stash drop'

        # Will cd into the top of the current repository
        # or submodule.
        alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

        # Git and svn mix
        alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'

        alias gsr='git svn rebase'
        alias gsd='git svn dcommit'
        #
        # Will return the current branch name
        # Usage example: git pull origin $(current_branch)
        #
        function current_branch() {
          ref=$(git symbolic-ref HEAD 2> /dev/null) || \
          ref=$(git rev-parse --short HEAD 2> /dev/null) || return
          echo ${ref#refs/heads/}
        }

        function current_repository() {
          ref=$(git symbolic-ref HEAD 2> /dev/null) || \
          ref=$(git rev-parse --short HEAD 2> /dev/null) || return
          echo $(git remote -v | cut -d':' -f 2)
        }

        # these aliases take advantage of the previous function
        alias ggpull='git pull origin $(current_branch)'
        alias ggpur='git pull --rebase origin $(current_branch)'
        alias ggpush='git push origin $(current_branch)'
        alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

        # these alias ignore changes to file
        alias gignore='git update-index --assume-unchanged'
        alias gunignore='git update-index --no-assume-unchanged'
        # list temporarily ignored files
        alias gignored='git ls-files -v | grep "^[[:lower:]]"'

        # Git Aliases AutoComplete
        type __git_complete >/dev/null 2>&1 && {
            __git_complete   g        _git
            __git_complete   gd       _git_diff
            __git_complete   gdc      _git_diff
            __git_complete   gl       _git_pull
            __git_complete   gup      _git_pull
            __git_complete   gp       _git_push
            __git_complete   gc       _git_commit
            __git_complete   gc!      _git_commit
            __git_complete   gca      _git_commit
            __git_complete   gca!     _git_commit
            __git_complete   gcmsg    _git_commit
            __git_complete   gco      _git_checkout
            __git_complete   gcm      _git_checkout
            __git_complete   gr       _git_remote
            __git_complete   grv      _git_remote
            __git_complete   grmv     _git_remote
            __git_complete   grrm     _git_remote
            __git_complete   grset    _git_remote
            __git_complete   grup     _git_remote
            __git_complete   grbi     _git_rebase
            __git_complete   grbc     _git_rebase
            __git_complete   grba     _git_rebase
            __git_complete   gb       _git_branch
            __git_complete   gba      _git_branch
            __git_complete   gcount   _git_shortlog
            __git_complete   gcl      _git_config
            __git_complete   gcp      _git_cherry_pick
            __git_complete   glg      _git_log
            __git_complete   glgg     _git_log
            __git_complete   glgga    _git_log
            __git_complete   glo      _git_log
            __git_complete   glog     _git_log
            __git_complete   gss      _git_log
            __git_complete   ga       _git_add
            __git_complete   gm       _git_merge
            __git_complete   grh      _git_reset
            __git_complete   grhh     _git_reset
            __git_complete   gwc      _git_whatchanged
            __git_complete   gmt      _git_mergetool
            __git_complete   gk       _gitk
            __git_complete   gsts     _git_stash
            __git_complete   gsta     _git_stash
            __git_complete   gstp     _git_stash
            __git_complete   gstd     _git_stash
            __git_complete   gsr      _git_svn
            __git_complete   gsd      _git_svn
        }

    把`C:\Program Files (x86)\Git\bin;`加入`PATH`变量，供之后使用`vundle`来安装其他插件


## Other

参考了大量的 [amix/vimrc](https://github.com/amix/vimrc) 的配置信息
