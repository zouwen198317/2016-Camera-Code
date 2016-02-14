#!/bin/sh
rm -rf build
mkdir build
echo "Compiling Main Camera Code"
g++ -ggdb `pkg-config opencv --cflags --libs` -o build/camera GetImage.cpp network.cpp camera.cpp `pkg-config --libs opencv` -Wall
echo "Compiling Camera Calibration Code"
g++ -ggdb `pkg-config opencv --cflags --libs` camera_calibration.cpp GetImage.cpp -o build/camera_calib `pkg-config --libs opencv`
if [ $1 = "run" ] ; then
  ./build/camera
fi
