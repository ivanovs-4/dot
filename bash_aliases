alias r='cd ../rasp 2>/dev/null || cd ~/work/rasp/rasp'
# alias t='cd ../ticket 2>/dev/null || cd ~/work/30/ticket'
# alias d='cd ../ticket_daemon 2>/dev/null || cd ~/work/standalone_ticket_daemon/ticket_daemon'
alias stack='stack --nix'
alias clip="xclip -selection clipboard"
alias agh="ag --haskell"

function sghci() { nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [$1])" --run ghci ; }

function fiw() { grep -r -nH -I --exclude-dir .stack-work/ --exclude-dir .git/ --exclude=tags -E "\b$1\b" . ; }
function fig() { grep -r -nH -I --exclude-dir .stack-work/ --exclude-dir .git/ --exclude=tags -E "$1" . ; }

alias hxd='hexdump -v -e "1/1 \" %02x\"" -e "1/1 \" %_c \n\" "'
alias l='ls -CF'

alias cb='xclip -selection clipboard'

function md() { mkdir -p "$1" ; cd "$1"; }

# Set 'history' format to show more useful info
export HISTTIMEFORMAT="%d/%m/%y %T "

# Force KMix to use raw ALSA mode (disable PulseAudio)
#export KMIX_PULSEAUDIO_DISABLE=1

alias tm="tmux attach || tmux"

if [ -f ~/.bash_aliases_git ]; then
    . ~/.bash_aliases_git
fi
