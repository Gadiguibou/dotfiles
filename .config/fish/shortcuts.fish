abbr cl clear
abbr v "$EDITOR"
abbr f "$FILE"
abbr e "$EDITOR"
abbr untar "tar -zxvf"
abbr ohmyzsh "code ~/.oh-my-zsh"
abbr zshconfig "code ~/.zshrc"
abbr fishconfig "code ~/.config/fish"
abbr alacconfig "code ~/.config/alacritty/alacritty.yml"
abbr cs "alacritty-colorscheme"
abbr ls "exa"
abbr la "exa -la"
abbr top "ytop"
abbr du "dust"
abbr cat "bat"
abbr grep "rg"
abbr ps "procs"
abbr cp "cp -iv"
abbr mv "mv -iv"
abbr rm "rm -v"
abbr mkd "mkdir -pv"
abbr g "git"
abbr ga "git add"
abbr gaa "git add ."
abbr gco "git checkout"
abbr gb "git branch"
abbr gf "git fetch"
abbr gc "git commit"
abbr gca "git commit --amend"
abbr py "python"
abbr py3 "python3"
abbr sdn "sudo shutdown -h now"
abbr rbt "sudo reboot"
abbr df "df -h"
abbr du "du -ch"
abbr ipp "curl ipinfo.io/ip"
abbr exdir "cd (exercism workspace)"

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

function rstpd
    /home/gabriel/.local/bin/rstpd.sh
end
function sysbackup
    sudo /home/gabriel/.local/bin/borg-system-backup.sh
end
function ls-man-installed
    /home/gabriel/.local/bin/list-manually-installed.sh
end

function update
    sudo apt update && sudo apt upgrade
    flatpak update
    cargo install-update -a
end

function gccs
    gcc-10 -Wall -Wextra -Wpedantic -Werror -O2 -std
    c99 -fanalyzer
    # -D_FORTIFY_SOURCE; 2 -fasynchronous-unwind-tables -fexceptions -fpic \
    # -shared -fstack-clash-protection -g -pipe
end

function ghdlr
    mkdir -p work && \
        ghdl -i --workdir=work *.vhd && \
        ghdl -m --workdir=work testbench && \
        ghdl -r --workdir=work testbench --vcd=wave.vcd && \
        gtkwave wave.vcd
end

function clippystrict
    cargo clippy \
        --all-targets \
        --all-features \
        -- \
        --deny clippy::all \
        --deny warnings \
        --deny clippy::pedantic \
        --deny clippy::cargo \
        --deny clippy::nursery
end

function rstfmtchk
    cargo fmt --all -- --check
end

function rustnew
    cargo new $argv[1] $argv[2] && cd ./$argv[1] && code .
end

function exnew
    exercism download --track=$argv[1] --exercise=$argv[2] && cd /home/gabriel/snap/exercism/5/exercism/$argv[1]/$argv[2] && code .
end

set COLOR_DIR "$HOME/.config/alacritty/colors/"
set LIGHT_COLOR "solarized_light.yaml"
set DARK_COLOR "solarized_dark.yaml"

function day
    alacritty-colorscheme -C $COLOR_DIR -a $LIGHT_COLOR -V
end

function night
    alacritty-colorscheme -C $COLOR_DIR -a $DARK_COLOR -V
end
