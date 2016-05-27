#!/bin/sh

trap "${KAFKA_HOME}/bin/kafka-server-stop.sh; echo 'Kafka stopped.'; ${KAFKA_HOME}/bin/zookeeper-server-stop.sh; echo 'Zookeeper stopped.'; exit" SIGHUP SIGINT SIGTERM

exec ${KAFKA_HOME}/bin/zookeeper-server-start.sh /kafka/config/zookeeper.properties &
exec ${KAFKA_HOME}/bin/kafka-server-start.sh /kafka/config/server.properties
