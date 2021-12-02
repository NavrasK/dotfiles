# Bash Alias
alias vim='nvim'

# Opens emacs in XTerm window (WSL)
alias emax='
export DISPLAY=:0.0
export LIBGL_ALWAYS_INDIRECT=1
setxkbmap -layout us
setsid emacs
exit
'

