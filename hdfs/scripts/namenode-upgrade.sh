#!/usr/bin/env bash

id -u ${USER} &>/dev/null || useradd -G hadoop ${USER}

trap "/etc/init.d/hadoop-hdfs-namenode stop" SIGTERM SIGKILL

/etc/init.d/hadoop-hdfs-namenode upgrade

tail -f /var/log/hadoop-hdfs/*.log
