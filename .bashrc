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

#Custom prompt
#PS1="\e[31m┌[\e[0m\u@\h\e[31m] [\e[0m\w\e[31m]\n└[\e[0m\s\e[31m]>\e[0m "

# User specific aliases and functions
alias http-server='python3 -m http.server'

# Running programs in background
alias joplin='Joplin-1.3.18.AppImage &'
alias discord='/home/murr/Discord/Discord &'
alias telegram='/home/murr/Telegram/Telegram &'
alias telegram-update='/home/murr/Telegram/Updater'

alias printc='import /home/murr/Imagens/Prints/$(date +%F-%R:%S).jpg'
alias print='import -window root /home/murr/Imagens/Prints/$(date +%F-%R:%S).jpg'
alias ssuspend='systemctl suspend'
alias poweroff='systemctl poweroff'
alias sreboot='systemctl reboot'
