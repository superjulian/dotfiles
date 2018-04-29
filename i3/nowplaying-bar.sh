#!/bin/sh
# shell script to prepend i3status with now plaing from mpd ncmpcpp
#echo '{"version":1}'
#echo '['
i3status --config /home/julian/.config/i3/i3status.conf | while :
do
        read line
	playing=$(ncmpcpp --current-song)
        echo $line
	#echo "$playing | $line" || exit 1
	#echo "[{\"full_text\":\"$playing\",\"color\":\"#ffffff\"}]" $line || exit 1
done
