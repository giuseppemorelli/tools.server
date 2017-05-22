#!/usr/bin/env bash

apt-get update
apt-get install -y nfs-kernel-server nfs-common
mkdir /var/nfs/
mkdir /var/nfs/rancher
chown nobody:nogroup /var/nfs -R

echo "/var/nfs *(fsid=0,rw,sync,no_root_squash,no_subtree_check)" >> /etc/exports

service nfs-kernel-server restart
exportfs -a

# Use /rancher in your rancher-nfs server