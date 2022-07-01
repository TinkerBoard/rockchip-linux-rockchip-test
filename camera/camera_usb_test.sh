#!/bin/bash
#export GST_DEBUG=*:5
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/gstreamer-1.0

# grep '' /sys/class/video4linux/video*/name
COMPATIBLE=$(cat /proc/device-tree/compatible)
if [[ $COMPATIBLE =~ "rk3588" ]]; then
	gst-launch-1.0 v4l2src device=/dev/video20 ! image/jpeg, width=1280, height=720, framerate=30/1 ! jpegparse ! mppjpegdec ! waylandsink sync=false
else
	gst-launch-1.0 v4l2src device=/dev/video10 ! image/jpeg, width=1280, height=720, framerate=30/1 ! jpegparse ! mppjpegdec ! waylandsink sync=false
fi
