#!/usr/bin/env bash

su - ${HDFS_USER}
/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/sbin/hadoop-daemon.sh --config ${HADOOP_CONF_DIR} start namenode
