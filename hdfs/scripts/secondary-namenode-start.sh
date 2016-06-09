#!/usr/bin/env bash

useradd -G hadoop ${USER}

for ((i=0;i<${SNAMENODE_DIRS_COUNT};i++));do
  mkdir -p ${SNAMENODE_PREFIX}/${i}
  chown -R hdfs:hdfs ${SNAMENODE_PREFIX}/${i}
  chmod 700 ${SNAMENODE_PREFIX}/${i}
done

trap "/etc/init.d/hadoop-hdfs-secondarynamenode stop" SIGTERM SIGKILL

/etc/init.d/hadoop-hdfs-secondarynamenode start

