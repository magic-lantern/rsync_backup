#! /bin/bash

echo '-------------------------------------'
echo `date`
gitlab-backup create
rsync -vrltDR --delete --delete-excluded --exclude-from=/root/rsync_exclusion_list.txt /home /etc /root /var/opt/gitlab/backups /media/data_mount/backup/servername_backup_weekly
find /home -printf "%m:%u:%g:%p\n" > /root/`date +\%Y\%m\%d\%H\%M\%S`-home-perms-cron.log
find /var/opt/gitlab/backups -printf "%m:%u:%g:%p\n" > /root/`date +\%Y\%m\%d\%H\%M\%S`-gitlab-perms-cron.log
mv /root/*cron.log /media/data_mount/backup/servername_backup_weekly/logs/
echo `date`
echo '-------------------------------------'
