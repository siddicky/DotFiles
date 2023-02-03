#!/usr/bin/env zsh
#
# Directory Shortcuts
# ======================================================================
# hash -d d=$HOME/Desktop
# Aliases
# ======================================================================
alias vpnip="ip -4 addr show tun0 | grep -oP \"(?<=inet\s)\d+(\.\d+){3}\""
alias pwdcp="echo -n $(pwd) | xclip -selection clipboard"
alias connectthm="sudo openvpn $HOME/Desktop/vpns/thm/siddicky.ovpn"
alias connecthtb="sudo openvpn $HOME/Desktop/vpns/htb/siddicky.ovpn"
alias xclip-copy="xclip -select clipboard"
alias connectpwk="sudo openvpn $HOME/Desktop/vpns/offsec/pwk2.ovpn"
alias connectwumed="sudo openvpn $HOME/Desktop/vpns/offsec/wumed.ovpn"
alias connectetbd="sudo openvpn $HOME/Desktop/vpns/offsec/etbd.ovpn"
alias connectawae="sudo openvpn $HOME/Desktop/vpns/offsec/awae.ovpn"
alias connectfun="sudo openvpn $HOME/Desktop/vpns/offsec/fundamentals.ovpn"
alias proxq="proxychains -q"
alias tap0="/opt/vpn-tap0.sh"
alias john-rockyou="john --wordlist=/usr/share/wordlists/rockyou.txt"
alias offsec-vpns="cd $HOME/Desktop/vpns/offsec"
alias vpns="cd $HOME/Desktop/vpns"
alias compiler="sudo systemd-nspawn -M exp-compiler --bind=/home -n --setenv=PATH=/opt/nim-1.6.2/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
alias connectuniversal="sudo openvpn $HOME/Desktop/vpns/offsec/universal.ovpn"
# ======================================================================
#
# Functions
# ======================================================================
# mcd: make and navigate into a new directory
mcd() {
    mkdir -p -- "$1" && cd -P -- "$1";
}
#
# HTTP Server
serve() {
    PORT=$1
    DIR=$2
    echo "Serving files from $DIR"
    python3 -m http.server "$PORT" --directory "$DIR"
}
#
# Netcat Reverse Shell
rev() {
    PORT=$1
    echo "Starting Netcat Listener on $PORT"
    echo "# python -c "import pty;pty.spawn(\"/bin/bash\")""
    echo "# python3 -c "import pty;pty.spawn(\"/bin/bash\")""
    rlwrap -cAr nc -lvnp "$PORT"
}
# Get fullpath of file
get() {
    file=$1
    echo "Location of the file copied to clipboard"
    realpath "$file" | xclip -select clipboard
}
# Nmap detailed scan
nmap_full() {
    nmap -p- $1 --min-rate 5000 | grep -w open | awk "{print $1}" | tr "\n" "," | sed "s/,$//" | xargs -I{} nmap -sCV -T4 -p {} $1 -oN
}
# Less Help Verbose
gethelp(){
    $1 --help --verbose | less
}
