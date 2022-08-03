if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -r -c config/polybar/config michaeltle &
  done
else
  polybar -r -c config/polybar/config michaeltle &
fi
