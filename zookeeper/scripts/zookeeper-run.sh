#!/bin/sh

trap "${ZOOKEEPER_HOME}/bin/zkServer.sh; echo 'Zookeeper stopped.'; exit" SIGHUP SIGINT SIGTERM

ls -la /zookeeper*
ls -la ${ZOOKEEPER_HOME}*

exec ${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground
