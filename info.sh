#!/bin/sh
echo "select distinct(src_ip) from query;" \
    | sqlite3 queries.db \
    | awk '{print "geoiplookup -f GeoLiteCity.dat " $1}' \
    | xargs -L 1 -d '\n' -P "$(nproc --all)" sh -c \
    | sort -u

