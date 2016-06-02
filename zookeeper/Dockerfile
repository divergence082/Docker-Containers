FROM anapsix/alpine-java:jdk8

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_ZOOKEEPER_VERSION=3.4.8
ENV ENV_ZOOKEEPER_WORKDIR=/zookeeper
ENV ZOO_LOG_DIR=${ENV_ZOOKEEPER_WORKDIR}/log
ENV ZOO_DATADIR=${ENV_ZOOKEEPER_WORKDIR}/data
ENV ZOOCFGDIR=${ENV_ZOOKEEPER_WORKDIR}/config
ENV ENV_ZOOKEEPER_HOME=/opt/zookeeper-${ENV_ZOOKEEPER_VERSION}

# Create necessary folders
WORKDIR ${ENV_ZOOKEEPER_WORKDIR}
RUN mkdir -p ${ZOO_DATADIR} ${ZOO_LOG_DIR} /opt

# Download and unpack zookeeper
ADD http://apache-mirror.rbc.ru/pub/apache/zookeeper/zookeeper-${ENV_ZOOKEEPER_VERSION}/zookeeper-${ENV_ZOOKEEPER_VERSION}.tar.gz /opt
RUN cd /opt && tar xzvf zookeeper-${ENV_ZOOKEEPER_VERSION}.tar.gz

# Mount necessary folders
VOLUME ${ZOOCFGDIR}

# Run
ENTRYPOINT ${ENV_ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground
