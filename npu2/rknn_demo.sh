#!/bin/bash

COMPATIBLE=$(cat /proc/device-tree/compatible)
if [[ $COMPATIBLE =~ "rk3588" ]]; then
rknn_common_test /usr/share/model/RK3588/mobilenet_v1.rknn /usr/share/model/dog_224x224.jpg 10
elif [[ $COMPATIBLE =~ "rk3566" && $COMPATIBLE =~ "rk3568" ]]; then
rknn_common_test /user/share/model/RK356X/mobilenet_v1.rknn /usr/share/model/dog_224x224.jpg 10
else
echo "The RKNPU2 did't support this Socs yet..."
fi
