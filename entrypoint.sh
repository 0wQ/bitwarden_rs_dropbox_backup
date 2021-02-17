#!/bin/sh

# setup dropbox uploader config file
/dropbox_uploader.sh -f /config/.dropbox_uploader info

# run backup once on container start to ensure it works
/backup.sh

# start crond in foreground
if [ ! -z $CRON ]
then
  echo "$CRON /backup.sh" > /etc/crontabs/root
fi
exec crond -f
