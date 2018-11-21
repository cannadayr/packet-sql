#!/bin/sh
./info.sh \
    | awk -F ", " '{print $7 " " $8}' \
    | plot-latlong-0.3/plot-latlong -s 10 -i plot-latlong-0.3/.mapinfo > plot.png
