# Bash Alias
alias vim='nvim'

# ls improved
alias ls='ls -A -F --color=auto --group-directories-first'

# exa alias for ls
alias la='exa -1 -l -F -a -h --group-directories-first --no-user --no-time --git'

# Opens emacs in XTerm window (WSL)
alias emax='
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
setxkbmap -layout us
setsid emacs
exit
'

