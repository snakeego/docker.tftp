#!/bin/sh
set -e

USER='nobody'
CMD='in.tftpd'

if [ ! -d "/tftp" ]; then mkdir /tftp; fi

if [ "${1:0:1}" = '-' ]; then
    set -- $CMD "$@"; 
fi

if [ "$1" = $CMD ] && [ "$(id -u)" = '0' ]; then
    shift
    
    [ "$(stat -c %U /tftp)" = $USER ] || chown -R $USER /tftp
    
    set -- $CMD -u $USER "$@"
fi

exec "$@"
