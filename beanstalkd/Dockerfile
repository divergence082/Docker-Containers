FROM alpine:3.3

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_BEANSTALKD_VERSION=1.10
ENV ENV_BEANSTALKD_WORKDIR=/beanstalkd
ENV ENV_BEANSTALKD_DATA_DIR=${ENV_BEANSTALKD_WORKDIR}/data
ENV ENV_BEANSTALKD_JOB_SIZE=2097152

# Install utils
RUN apk add --update make g++

# Create necessary folders
WORKDIR ${ENV_BEANSTALKD_WORKDIR}
RUN mkdir -p ${ENV_BEANSTALKD_DATA_DIR} /opt

# Download and unpack beanstalkd
ADD https://github.com/kr/beanstalkd/archive/v${ENV_BEANSTALKD_VERSION}.tar.gz /opt
RUN cd /opt && tar xzvf v${ENV_BEANSTALKD_VERSION}.tar.gz

# Build beanstalkd
RUN cd /opt/beanstalkd-${ENV_BEANSTALKD_VERSION} && \
    sed -i "s|#include <sys/fcntl.h>|#include <fcntl.h>|g" sd-daemon.c && \
    make -j4 && \
    make install PREFIX=/usr

# Run
ENTRYPOINT beanstalkd -b ${ENV_BEANSTALKD_DATA_DIR} -z ${ENV_BEANSTALKD_JOB_SIZE}
