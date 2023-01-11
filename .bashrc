# Bash Options
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=100000
PROMPT_COMMAND="history -a;$PROMPT_COMMAND" # Makes writing to history immediate, so nothing is lost if a shell is killed without a proper `exit` - https://askubuntu.com/questions/67283/is-it-possible-to-make-writing-to-bash-history-immediate

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
export PS1="\[$(tput sgr0)\]\012\[\033[38;5;241m\]"'$(printf "\\u00B7%.0s" $(seq 21 $(tput cols)))'" \[$(tput bold)\]\[\033[38;5;218m\]\d \[\033[38;5;212m\]\t"'$(echocr)'"\[\033[38;5;38m\]\w\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;14m\]"'$(__git_ps1 " %s")'" \[$(tput sgr0)\]\012❱ \[$(tput sgr0)\]"
# https://github.com/git-for-windows/git/issues/3303

# Aliases
alias aliases='alias'
alias c='cargo'
alias cargo='cargo --color=always'
alias cb='c build'
alias cbr='c build --release'
alias cc='c clippy'
alias cdd='c doc'
alias cdda='c doc --all-features'
alias cddar='c doc --all-features --release'
alias cddars='c doc --all-features --release && file-server -p 6969 ./target/doc'
alias cddas='c doc --all-features && file-server -p 6969 ./target/doc'
alias cddr='c doc --release'
alias cddrs='c doc --release && file-server -p 6969 ./target/doc'
alias cdds='c doc && file-server -p 6969 ./target/doc'
alias ce='c expand --color=always --theme=OneHalfDark'
alias cf='c fmt --all'
alias cfc='c fmt --all --check'
alias cl='c clean'
alias cm='c miri'
alias cmr='c miri run'
alias cmrr='c miri run --release'
alias cmt='c miri test'
alias cmtr='c miri test --release'
alias cn='c generate'
alias cng='c generate general --define username=zedseven --name' # Designed for use with https://github.com/zedseven/rust-template-general
alias cql='c license --color=always'
alias cqla='c license --color=always --authors'
alias cqo='c outdated --color=always --root-deps-only'
alias cqof='c outdated --color=always' # Full
alias cqu='c update --color=always'
alias cr='c run'
alias crr='c run --release'
alias ct='c test'
alias ctd='c test --doc'
alias ctns='c nono check && c build --target wasm32-unknown-unknown' # no-std compatibility test - https://www.reddit.com/r/rust/comments/n7lz9x/writing_no_std_crates/gxdkjgu/
alias ctr='c test --release'
alias ctt='c tree'
alias cttd='c tree --duplicates'
alias e='exit'
alias g='git'
alias ga='g add'
alias gb='g branch'
alias gc='g commit --gpg-sign --message'
alias ge='g checkout'
alias gf='g fetch'
alias gl='g log --show-signature'
alias gm='g remote'
alias go='g clone'
alias gp='g push'
alias gpu='g push --set-upstream'
alias gr='g reset'
alias grao='g remote add origin'
alias gs='g status'
alias gu='g pull'
alias gy='g apply'
alias ll='ls -la'
alias ls='ls -hc --color=always'
alias rg='rg --pretty --smart-case --stats'
alias w='clear' # Think of it as "wipe" for wiping the screen clear
