#!/bin/bash

set -e

# USERNAME PASSWORD VOL_NAME VOL_ROOT [VOL_SIZE_MB]
add-account gauth Skulblaka24 Time_Machine_Gauth /timemachine/gauth 2000000

if [ ! -e /.initialized_user ] && [ ! -z "$AFP_LOGIN" ] && [ ! -z "$AFP_PASSWORD" ] && [ ! -z "$AFP_NAME" ] && [ ! -z $PUID ] && [ ! -z $PGID ]; then
    add-account -i $PUID -g $PGID "$AFP_LOGIN" "$AFP_PASSWORD" "$AFP_NAME" /timemachine $AFP_SIZE_LIMIT
    touch /.initialized_user
fi

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
