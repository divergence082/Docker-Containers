#!/usr/bin/env bash

trap "/etc/init.d/hadoop-hdfs-namenode stop" SIGTERM SIGKILL

/etc/init.d/hadoop-hdfs-namenode upgrade