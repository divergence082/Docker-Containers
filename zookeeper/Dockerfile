FROM anapsix/alpine-java:jdk8

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ZOOKEEPER_VERSION=3.4.8
ENV ZOOKEEPER_HOME=/opt/zookeeper-${ZOOKEEPER_VERSION}
ENV ZOO_LOG_DIR=/zookeeper/log
ENV ZOO_DATADIR=/zookeeper/data
ENV ZOOCFGDIR=/zookeeper/config
#ENV ZOOCFG=${ZOOCFGDIR}/zoo.cfg

# Create necessary folders
RUN mkdir -p /zookeeper/data /zookeeper/log /opt

# Download and unpack Kafka
ADD http://apache-mirror.rbc.ru/pub/apache/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz /opt
RUN cd /opt && tar xzvf zookeeper-${ZOOKEEPER_VERSION}.tar.gz

# Copy script
ADD scripts/zookeeper-run.sh /bin/zookeeper-run
RUN chmod a+x /bin/zookeeper-run

# Mount necessary folders
VOLUME ["/zookeeper/config"]

ENTRYPOINT zookeeper-run
