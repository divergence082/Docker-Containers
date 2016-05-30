#!/bin/sh

beanstalkd -b /beanstalkd/data -z ${BEANSTALKD_JOB_SIZE}
