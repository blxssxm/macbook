xset r rate 300 150 &
setkeycodes e038 57
setxkbmap -option caps:super &
killall xcape 2>/dev/null ; xcape -e 'Super_L=Escape' &
xmodmap -e 'keycode 135 = Super_R' &
xset -q | grep "Caps Lock:\s*on" && xdotool key Caps_Lock &
xwallpaper --zoom /home/dawn/black.png &
unclutter &
setxkbmap gb
#exec dwm
dbus-run-session bspwm
/usr/libexec/xfce-polkit &
#exec twm
#./ /home/dawn/.config/polybar/launch.sh

