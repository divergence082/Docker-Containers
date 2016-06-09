#!/usr/bin/env bash

id -u ${USER} &>/dev/null || useradd -G hadoop ${USER}

hdfs namenode -format

for ((i=0;i<${NAMENODE_DIRS_COUNT};i++));do
  mkdir -p ${NAMENODE_PREFIX}/${i}
  chown -R hdfs:hdfs ${NAMENODE_PREFIX}/${i}
  chmod 700 ${NAMENODE_PREFIX}/${i}
done

trap "/etc/init.d/hadoop-hdfs-namenode stop" SIGTERM SIGKILL

/etc/init.d/hadoop-hdfs-namenode start

tail -f /var/log/hadoop-hdfs/*.log
