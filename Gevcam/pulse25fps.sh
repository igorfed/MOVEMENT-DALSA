#!/bin/sh

while true; do
echo 1 > /sys/class/gpio/gpio255/value
sleep 0.02
echo 0 > /sys/class/gpio/gpio255/value
sleep 0.02
done
