# > DWM Configuration <
# Wallpaper
feh --bg-fill "/home/murr/Imagens/backgrounds/wallhaven-0wg61x_2560x1440.png" &

# Locker
xautolock -time 2 -locker suspendlock &

# Status bar
while :; do
    BATT=$(acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi')
    BATT_ICON=""
    DATE=$(date '+%D')
    HOUR=$(date '+%H:%M')
    SOUND_VOLUME=$(amixer get Master | grep "Left:" | awk {'print $5'} | sed 's/\[\|\]//g')
    SOUND_STATUS=$(amixer get Master | grep "Left:" | awk {'print $6'} | sed 's/\[\|\]//g')
    WIRELESS=$(cat /sys/class/net/wlp2s0/operstate)
    BRIGHTNESS=$(brightlight -p | awk '{print $5}')


    if [[ $(acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi') == "Discharging" ]]; then
        BATT_ICON="↓"
    else
        BATT_ICON="↑"
    fi

    xsetroot -name " V: $SOUND_VOLUME ${SOUND_STATUS^^} | W: ${WIRELESS^^} | B:$BRIGHTNESS |
BATT: $BATT% $BATT_ICON | $DATE | $HOUR "
done &
