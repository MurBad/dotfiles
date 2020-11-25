# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias http-server='python3 -m http.server'
alias joplin='Joplin-1.3.18.AppImage &'
alias discord='/home/murr/Discord/Discord &'
alias printc='import /home/murr/Imagens/Prints/$(date +%F-%R:%S).jpg'
alias print='import -window root /home/murr/Imagens/Prints/$(date +%F-%R:%S).jpg'
