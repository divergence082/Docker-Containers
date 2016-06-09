#!/bin/sh

trap "${ENV_ZOOKEEPER_HOME}/bin/zkServer.sh stop" SIGTERM SIGKILL

${ENV_ZOOKEEPER_HOME}/bin/zkServer.sh start

tail -f ${ZOO_LOG_DIR}/*
