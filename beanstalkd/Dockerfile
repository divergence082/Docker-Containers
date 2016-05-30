FROM alpine:3.3

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV BEANSTALKD_VERSION=1.10
ENV BEANSTALKD_JOB_SIZE=2097152
ENV BEANSTALKD_HOME /opt/beanstalkd-${BEANSTALKD_VERSION}

# Create necessary folders
RUN mkdir -p /beanstalkd/data /opt

# Install utils
RUN apk add --update make g++

# Download and unpack Beanstalkd
ADD https://github.com/kr/beanstalkd/archive/v${BEANSTALKD_VERSION}.tar.gz /opt
RUN cd /opt && tar xzvf v${BEANSTALKD_VERSION}.tar.gz

# Build Beanstalkd
RUN cd /opt/beanstalkd-${BEANSTALKD_VERSION} && \
    sed -i "s|#include <sys/fcntl.h>|#include <fcntl.h>|g" sd-daemon.c && \
    make -j4 && \
    make install PREFIX=/usr

# Copy script
ADD scripts/beanstalkd-run.sh /bin/beanstalkd-run
RUN chmod a+x /bin/beanstalkd-run

ENTRYPOINT beanstalkd-run
