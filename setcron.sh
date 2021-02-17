#!/bin/sh

if [ ! -z $CRON ]
then
  CRON = '0 1 * * *'
fi

echo "$CRON /backup.sh" > /etc/crontabs/root
