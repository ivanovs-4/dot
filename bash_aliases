alias clip="xclip -selection clipboard"

function sghci() { nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [$1])" --run ghci ; }

function fiw() { grep -r -nH -I --exclude-dir .stack-work/ --exclude-dir .git/ --exclude=tags -E "\b$1\b" . ; }
function fig() { grep -r -nH -I --exclude-dir .stack-work/ --exclude-dir .git/ --exclude=tags -E "$1" . ; }

alias hxd='hexdump -v -e "1/1 \" %02x\"" -e "1/1 \" %_c \n\" "'

# Set 'history' format to show more useful info
export HISTTIMEFORMAT="%d/%m/%y %T "

# Force KMix to use raw ALSA mode (disable PulseAudio)
#export KMIX_PULSEAUDIO_DISABLE=1

alias tm="tmux attach || tmux"

if [ -f ~/.bash_aliases_git ]; then
    . ~/.bash_aliases_git
fi


# make compact jq output
# move comma
# collect closing }
# move join alone , with next {
# move object up to opening {

alias cj="sed -zEe 's/\n(\s*)  \},/ }\n\1,/g' | sed -z -E -e 's/\n\s*\}/ }/g' | sed -z -E -e 's/(\n\s*\{\s*)\n\s*/\1/g' | sed -zEe 's/(\n\s*,)\s*\n\s*\{/\1 {/g'"
alias cj="sed -zEe 's/\n(\s*)  \},/ }\n\1,/g' | sed -z -E -e 's/\n\s*\}/ }/g' | sed -z -E -e 's/(\n\s*\{)\s*\n\s*/\1 /g' | sed -zEe 's/(\n\s*,)\s*\n\s*\{/\1 {/g'"


if [ -f ~/.bash_aliases_git ]; then
    . ~/.bash_aliases_git
fi
