FROM anapsix/alpine-java:jdk8

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV SCALA_VERSION=2.11
ENV KAFKA_VERSION=0.10.0.0
ENV FULL_KAFKA_VERSION=${SCALA_VERSION}-${KAFKA_VERSION}
ENV KAFKA_HOME /opt/kafka_${FULL_KAFKA_VERSION}

# Create necessary folders
RUN mkdir -p /kafka/log /kafka/data /opt

# Download and unpack Kafka
ADD http://apache-mirror.rbc.ru/pub/apache/kafka/${KAFKA_VERSION}/kafka_${FULL_KAFKA_VERSION}.tgz /opt
RUN cd /opt && tar xzvf kafka_${FULL_KAFKA_VERSION}.tgz

# Copy script
ADD scripts/kafka-run.sh /bin/kafka-run
RUN chmod a+x /bin/kafka-run

# Mount necessary folders
VOLUME ["/kafka/config"]

ENTRYPOINT kafka-run
