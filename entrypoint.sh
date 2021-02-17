#!/bin/sh

# setup dropbox uploader config file
/dropbox_uploader.sh -f /config/.dropbox_uploader info

# run backup once on container start to ensure it works
/backup.sh

# start crond in foreground
[ -z "${CRON}" ] && CRON='0 1 * * *'
echo "${CRON} /backup.sh" > /etc/crontabs/root
exec crond -f
