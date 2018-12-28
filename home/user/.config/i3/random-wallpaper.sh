#!/bin/bash

images=$(ls $HOME/Pictures/**/* | grep -E "(png|jpg)" | grep -v "Harold")
random_image=$(echo "$images" | sort -R | head -n1)

feh --bg-fill $random_image
