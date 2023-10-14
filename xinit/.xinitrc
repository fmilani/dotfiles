xrandr --output eDP-1 --mode 1280x720

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &

dwmblocks &
exec /home/felipe/.bin/startdwm

