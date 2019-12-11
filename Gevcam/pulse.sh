#!/bin/sh

while true; do
		echo 1 > /sys/class/gpio/gpio255/value
		echo 1 > /sys/class/gpio/gpio254/value
		sleep 0.1
		echo 0 > /sys/class/gpio/gpio255/value
		echo 0 > /sys/class/gpio/gpio254/value
		sleep 0.1
done
