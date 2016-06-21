alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alFGS'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -hG'
alias work='cd ~/work'


# 设置保存历史命令的文件大小
export HISTFILESIZE=1000000000
# 保存历史命令条数
export HISTSIZE=1000000
# 实时记录历史命令，默认只有在用户退出之后才会统一记录，很容易造成多个用户间的相互覆盖。
export PROMPT_COMMAND="history -a"
# 记录每条历史命令的执行时间
#export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "
