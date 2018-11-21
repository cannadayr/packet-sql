#!/bin/bash
sudo tcpdump -l -n -i eth0 dst port 53 and inbound | gawk -f <(autom4te -l m4sugar filter.awk.m4) | sqlite3 queries.db

# see `man tcpdump` for output formatting

