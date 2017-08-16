#!/bin/sh

echo "CONFIG = { 'username': '$USERNAME', 'password': '$PASSWORD', 'url': 'https://$CPANEL_HOST:$CPANEL_PORT' }" > config.py

CRONFILE=/tmp/crontab.txt

# CRONTASK_ vars use a special format so need to be processed separately
for item in `env`
do
   case "$item" in
       CRONTASK_*)
            ENVVAR=`echo $item | cut -d \= -f 1`
            printenv $ENVVAR | sed 's/"\(.*\)"/\1/' >> $CRONFILE
            ;;
   esac
done

/usr/bin/crontab $CRONFILE

/usr/sbin/crond -f
