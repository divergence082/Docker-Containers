#!/bin/sh

trap "${KAFKA_HOME}/bin/kafka-server-stop.sh; echo 'Kafka stopped.'; exit" SIGHUP SIGINT SIGTERM

exec ${KAFKA_HOME}/bin/kafka-server-start.sh /kafka/config/server.properties
