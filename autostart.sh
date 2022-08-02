#/bin/sh

# ---------------- monitors  ----------------
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 1634x1440 --rotate normal --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --mode 2560x1440 --pos 0x0 --rotate normal

hsetroot -solid "#282a36"

# ---------------- statusbar ----------------
clock() {
	dte=$(date +"%D")
	time=$(date +"%H:%M")

	echo "date: $dte time: $time"
}

network() {
	conntype=$(ip route | awk '/default/ { print substr($5,1,1) }')

	if [ -z "$conntype" ]; then
		echo "net: down"
	elif [ "$conntype" = "e" ]; then
		echo "ethernet: up"
	elif [ "$conntype" = "w" ]; then
		echo "wifi: up"
	fi
}

cpu() {
	read -r cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read -r cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	echo "cpu: $cpu"
}

ram() {
	mem=$(free -h | awk '/Mem:/ { print $3 }' | cut -f1 -d 'i')
	echo "ram: $mem"
}




statusbar() {
	while true; do
		xsetroot -name " $(ram) | $(cpu) | $(network) | $(clock)"
		sleep 1
	done
}

statusbar && exec picom
