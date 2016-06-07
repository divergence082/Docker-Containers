#!/usr/bin/env bash

su - ${HDFS_USER}
/usr/hdp/current/hadoop-hdfs-namenode/../hadoop/bin/hdfs namenode -format
