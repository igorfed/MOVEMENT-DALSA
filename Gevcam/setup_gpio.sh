#This script can not be run
#Run each command seperatly
sudo su
echo 255 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio255/direction
chmod +w /sys/class/gpio/gpio255/value

echo 254 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio254/direction
chmod +w /sys/class/gpio/gpio254/value

exit
