#!/usr/bin/env bash

apt-get update
apt-get install nfs-kernel-server nfs-common
mkdir /mnt/nfs
chown nobody:nogroup /mnt/nfs
chmod 775 /mnt/nfs

echo "
/mnt/nfs * (rw,sync,no_subtree_check)
/mnt/nfs * (rw,sync,fsid=0,crossmnt,no_subtree_check,no_root_squash)
" > /etc/exports

service nfs-kernel-server restart