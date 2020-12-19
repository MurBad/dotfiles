# > DWM Configuration <
# Wallpaper
feh --bg-fill "/home/murr/Imagens/backgrounds/wallhaven-0wg61x_2560x1440.png" &

# Locker
xautolock -time 2 -locker slock &

# Notification Daemon
dusnt &

# Status bar
while :; do
  statusbar #Script in ~/bin/
done &
