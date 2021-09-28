# Prepare the __git_ps1 command for use in PS1
GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
if test -f "$COMPLETION_PATH/git-prompt.sh"
then
	. "$COMPLETION_PATH/git-completion.bash"
	. "$COMPLETION_PATH/git-prompt.sh"
fi

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE="true"
export GIT_PS1_SHOWSTASHSTATE="true"
export GIT_PS1_SHOWUNTRACKEDFILES="true"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_COMPRESSSPARSESTATE="true"

# http://bashrcgenerator.com/
# https://stackoverflow.com/a/21368867/6003488

# PS1
# https://stackoverflow.com/a/37074809/6003488
function echonl() {
	echo -e -n "\n"
}
function echocr() {
	echo -e -n "\r"
}
#export PS1="\n\[$(tput bold)\]\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\`__git_ps1 \" %s\"\`\[$(tput sgr0)\]\n❱ \[$(tput sgr0)\]"
#export PS1="\n\[\033[38;5;241m\]$(printf "\\u00B7%.0s" $(seq 21 $(tput cols))) \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t\r\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\`__git_ps1 \" %s\"\` \[$(tput sgr0)\]\n❱ \[$(tput sgr0)\]"
#export PS1="\n\[\033[38;5;241m\]\`printf \"\\u00B7%.0s\" \\\`seq 21 \\\\\\\`tput cols\\\\\\\`\\\`\` \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t\r\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]\`__git_ps1 \" %s\"\` \[$(tput sgr0)\]\n❱ \[$(tput sgr0)\]"
#export PS1="\012\[\033[38;5;241m\]"'$(printf "\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t\015\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]"'$(__git_ps1 " %s")'" \[$(tput sgr0)\]\012❱ \[$(tput sgr0)\]"
#export PS1="\012\[\033[38;5;241m\]"'$(printf "\\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t$(echo $'\r')"
#export PA="\012\[\033[38;5;241m\]"'$(printf "\\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t"
#export PB="\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]"'$(__git_ps1 " %s")'" \[$(tput sgr0)\]\012❱ \[$(tput sgr0)\]"
#export PS1="$PA"'$(echo $''\r'')'"$PB"
#export PS1='$(echo test)\n'
export PS1="\[$(tput sgr0)\]\012\[\033[38;5;241m\]"'$(printf "\\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t"'$(echocr)'"\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]"'$(__git_ps1 " %s")'" \[$(tput sgr0)\]\012❱ \[$(tput sgr0)\]"
#export PS1="$(echonl)\[\033[38;5;241m\]"'$(printf "\\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t"'$(echocr)'"\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]"'$(__git_ps1 " %s")'" \[$(tput sgr0)\]$(echonl)❱ \[$(tput sgr0)\]"
# https://github.com/git-for-windows/git/issues/3303

# Aliases
alias e='exit'
alias w='clear'
alias ls='ls -hc --color=always'
alias ll='ls -la'
alias g='git'
alias ga='g a'
alias gc='g c'
alias gs='g s'
alias gp='g p'
alias gl='g l'
alias cargo='cargo --color=always'
alias c='cargo'
alias cb='c build'
alias cbr='c build --release'
alias cr='c run'
alias crr='c run --release'
alias ct='c test'
alias ctr='c test --release'
alias cm='c miri'
alias cmr='c miri run'
alias cmrr='c miri run --release'
alias cmt='c miri test'
alias cmtr='c miri test --release'
alias cl='c clean'
alias cc='c clippy'
alias ct='c tree'
alias cn='c generate'
alias cng='c generate general --name'
