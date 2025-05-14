#!/bin/bash

IP=127.0.0.1

nc -vz $IP 80 443 &>/dev/null
if [ $? -ne 0 ]; then
    exit 1
elif [ $(curl -Is http://$IP/index.html |  grep "200 OK" | wc -l) -ne 1 ]; then
    exit 2
elif [ ! -f "/var/www/public/index.html" ]; then
    exit 3
fi
exit 0
