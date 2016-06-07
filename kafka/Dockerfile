FROM anapsix/alpine-java:jdk8

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_SCALA_VERSION=2.11
ENV ENV_KAFKA_VERSION=0.10.0.0
ENV ENV_FULL_KAFKA_VERSION=${ENV_SCALA_VERSION}-${ENV_KAFKA_VERSION}
ENV ENV_KAFKA_WORKDIR /kafka
ENV ENV_KAFKA_DATA_DIR=${ENV_KAFKA_WORKDIR}/data
ENV ENV_KAFKA_CONFIG_DIR=${ENV_KAFKA_WORKDIR}/config
ENV ENV_KAFKA_LOG_DIR=${ENV_KAFKA_WORKDIR}/log
ENV ENV_KAFKA_HOME=/opt/kafka_${ENV_FULL_KAFKA_VERSION}

# Create necessary folders
WORKDIR ${ENV_KAFKA_WORKDIR}
RUN mkdir -p ${ENV_KAFKA_DATA_DIR} ${ENV_KAFKA_LOG_DIR} /opt

# Download and unpack Kafka
ADD http://apache-mirror.rbc.ru/pub/apache/kafka/${ENV_KAFKA_VERSION}/kafka_${ENV_FULL_KAFKA_VERSION}.tgz /opt
RUN cd /opt && tar xzvf kafka_${ENV_FULL_KAFKA_VERSION}.tgz

# Mount necessary folders
VOLUME ${ENV_KAFKA_CONFIG_DIR}

# Run
ENTRYPOINT ${ENV_KAFKA_HOME}/bin/kafka-server-start.sh ${ENV_KAFKA_CONFIG_DIR}/server.properties
