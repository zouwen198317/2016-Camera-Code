#!/bin/bash
v4l2-ctl -c exposure_auto=1
v4l2-ctl -c exposure_absolute=20
/home/ubuntu/code/keepRunning.sh &
renice -n -1 -p $(ps -ef | grep ./build/camera | grep -v grep | awk '{print $3}')
echo 0 > /sys/devices/system/cpu/cpuquiet/tegra_cpuquiet/enable 
echo 1 > /sys/devices/system/cpu/cpu0/online
echo 1 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu2/online
echo 1 > /sys/devices/system/cpu/cpu3/online
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor 
echo 852000000 > /sys/kernel/debug/clock/override.gbus/rate
echo 1 > /sys/kernel/debug/clock/override.gbus/state
