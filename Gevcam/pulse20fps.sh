#!/bin/sh

while true; do
echo 1 > /sys/class/gpio/gpio255/value
sleep 0.025
echo 0 > /sys/class/gpio/gpio255/value
sleep 0.025
done
