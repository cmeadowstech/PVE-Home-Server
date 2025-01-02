#!/bin/bash

# Export postgres db
ssh -i ~/.ssh/pve-server postgres@10.0.0.205 pg_dumpall -U postgres -f backup_file.sql
rsync -rtvu --delete -e "ssh -i ~/.ssh/pve-server" postgres@10.0.0.205:backup_file.sql /mnt/pve-share/config/postgres/backup

# Backup

rsync -rtvu --delete /mnt/pve-share/Documents /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/Git /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/Media /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/config /mnt/backup/

