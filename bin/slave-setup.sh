#!/bin/bash
#
# 
#
#

mkdir -p /data/hadoop
chown -R hadoop.hadoop /data/hadoop

mkdir -p /var/opt/hadoop/pids
mkdir -p /var/log/hadoop
chown -R hadoop.hadoop /var/log/hadoop /var/opt/hadoop

