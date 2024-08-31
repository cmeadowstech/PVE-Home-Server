#!/bin/bash

rsync -rtvu --delete /mnt/pve-share/Documents /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/Git /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/Media /mnt/backup/
rsync -rtvu --delete /mnt/pve-share/config /mnt/backup/