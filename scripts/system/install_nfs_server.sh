#!/usr/bin/env bash

apt-get update
apt-get install -y nfs-kernel-server nfs-common
mkdir /mnt/nfs/
mkdir /mnt/nfs/rancher
chown nobody:nogroup /mnt/nfs -R

echo "/mnt/nfs *(fsid=0,rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

service nfs-kernel-server restart
exportfs -a

# Use /rancher in your rancher-nfs server