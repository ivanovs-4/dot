alias r='cd ../rasp 2>/dev/null || cd ~/work/rasp/rasp'
alias t='cd ../ticket 2>/dev/null || cd ~/work/30/ticket'
alias d='cd ../ticket_daemon 2>/dev/null || cd ~/work/standalone_ticket_daemon/ticket_daemon'

alias hxd='hexdump -v -e "1/1 \" %02x\"" -e "1/1 \" %_c \n\" "'
alias l='ls -CF'

alias pp='python -mjson.tool'
pyf() { find . -name '*.py' -exec grep -nH "$1" {} \; ; }

alias sl="sed 's/&quot;/\"/g' | sed -r 's/></>\n</g' | less"

alias tm="tmux attach || tmux"

if [ -f ~/.bash_aliases_git ]; then
    . ~/.bash_aliases_git
fi
