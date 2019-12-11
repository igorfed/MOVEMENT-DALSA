#!/bin/bash
#./bin/capture_tohour -f5 -H13 -M00 -B1000000 -o Video/A;
START="080000"
END="160000"
echo $START
echo $END
while true; do
NOW=$(date +"%H%M%S")
NOWMIN=$(date +"%M")

if [[ "$NOW" < "$START" ]] && [[ "$NOW" > "$END" ]]  ; then
	echo 'STOP PULSE'
else 
	if [[ "$NOWMIN" > "55" ]]; then
		echo 'STOP PULSE'
	else
		echo 1 > /sys/class/gpio/gpio255/value
		echo 1 > /sys/class/gpio/gpio254/value
		sleep 0.1
		echo 0 > /sys/class/gpio/gpio255/value
		echo 0 > /sys/class/gpio/gpio254/value
		sleep 0.1
	fi
fi
done
#do
#if [[ $currentTime -ge $StrTime && $currentTime -le $EndTime ]];
#then
#	echo '1'
#else 
#	echo '0'
#fi 
#done
run_pulse
{
	echo 1 > /sys/class/gpio/gpio255/value
	echo 1 > /sys/class/gpio/gpio254/value
	sleep 0.1
	echo 0 > /sys/class/gpio/gpio255/value
	echo 0 > /sys/class/gpio/gpio254/value
	sleep 0.1	
}
#while true; do
#   currenttime=$(date +%H:%M)
#   if [[ "$currenttime" > "8:00" ]] || [[ "$currenttime" < "9:00" ]]; then#
#	echo 'Run'
#	echo 1 > /sys/class/gpio/gpio255/value
#	echo 1 > /sys/class/gpio/gpio254/value
#	sleep 0.1
#	echo 0 > /sys/class/gpio/gpio255/value
#	echo 0 > /sys/class/gpio/gpio254/value
#	sleep 0.1
 #  else
  #  echo 0 > /sys/class/gpio/gpio255/value
#	echo 0 > /sys/class/gpio/gpio254/value
#	echo 'pulse is stopped  - time is outside the Maintenance Window'
#  fi
#done
