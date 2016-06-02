FROM alpine:3.3

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_BEANSTALKD_VERSION=1.10
ENV ENV_BEANSTALKD_JOB_SIZE=2097152
ENV ENV_BEANSTALKD_HOME /opt/beanstalkd-${ENV_BEANSTALKD_VERSION}

# Install utils
RUN apk add --update make g++

# Create necessary folders
RUN mkdir -p /beanstalkd/data /opt

# Download and unpack beanstalkd
ADD https://github.com/kr/beanstalkd/archive/v${ENV_BEANSTALKD_VERSION}.tar.gz /opt
RUN cd /opt && tar xzvf v${ENV_BEANSTALKD_VERSION}.tar.gz

# Build beanstalkd
RUN cd /opt/beanstalkd-${ENV_BEANSTALKD_VERSION} && \
    sed -i "s|#include <sys/fcntl.h>|#include <fcntl.h>|g" sd-daemon.c && \
    make -j4 && \
    make install PREFIX=/usr

ENTRYPOINT beanstalkd -b /beanstalkd/data -z ${ENV_BEANSTALKD_JOB_SIZE}
