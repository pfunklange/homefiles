#! /bin/bash
OS=$(uname)
du -a $1 | sort -nr | cut -f 2 | head -n 50 | awk '{print "\"" $0 "\""}'  |xargs du -hs
