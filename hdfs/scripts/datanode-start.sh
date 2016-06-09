#!/usr/bin/env bash

id -u ${USER} &>/dev/null || useradd -G hadoop ${USER}

for ((i=0;i<${DATANODE_DIRS_COUNT};i++));do
  mkdir -p ${DATANODE_PREFIX}/${i}
  chown -R hdfs:hdfs ${DATANODE_PREFIX}/${i}
  chmod 700 ${DATANODE_PREFIX}/${i}
done

trap "/etc/init.d/hadoop-hdfs-datanode stop" SIGTERM SIGKILL

/etc/init.d/hadoop-hdfs-datanode start

tail -f /var/log/hadoop-hdfs/*.log
