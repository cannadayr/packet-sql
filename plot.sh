#!/bin/sh
#map=World # default
map=USA200 # higher res USA
#pixels=10 # default plot size
pixels=20
./info.sh \
    | awk -F ", " '{print $7 " " $8}' \
    | plot-latlong-0.3/plot-latlong -m ${map} -s ${pixels} -i plot-latlong-0.3/.mapinfo > images/${map}.png
