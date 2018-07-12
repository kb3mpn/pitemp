#!/bin/bash
CPUSOURCE=`cat /sys/class/thermal/thermal_zone0/temp`
GPUSOURCE=`vcgencmd measure_temp | cut -c 6-9`
CPUCALC=`expr $CPUSOURCE / 1000`
CPU=`echo “scale=2;((9/5) * $CPUCALC ) + 32”| bc`
GPU=`echo “scale=2;((9/5) * $GPUSOURCE ) + 32”| bc`
echo CPU = $CPU
echo GPU = $GPU
