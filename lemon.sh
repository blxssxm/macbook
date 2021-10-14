#!/bin/sh
. ./common.sh
clock() {
    date | awk '{ print $6,$1,$2,$3,$4 }'
}
battery() {
    #cat /sys/class/power_supply/BAT0/capacity && cat /sys/class/power_supply/BAT0/status
	sb-battery
}
ram() {
	free -h | awk '/^Mem:/ {print $3 "/" $2}'
}
temp() {
    sensors | awk '/^temp1/ {print $2}'
}
audio() {
	awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)
}
bspc_desktops() {
    desktops=$(bspc query -D --names)
    buf=""
    for d in ${desktops[@]}; do
        if [[ "$(bspc query -D -d focused --names)" == "${d}" ]]; then
            buf="${buf}%{B${color_hl2}}  ${d}  %{B-}"
        else
            buf="${buf}%{B${color_hl1}} ${d} "
        fi
    done
    echo "${buf}"
}
while true; do
    BAR_INPUT="%{l} $(battery)% | $(ram) | $(temp) | VOL: 45%"
	MUSIC_INPUT="%{c}$(bspc_desktops)"
	DATE_INPUT="%{r} $(clock)"
	echo $BAR_INPUT $MUSIC_INPUT $DATE_INPUT
    sleep 2
done

