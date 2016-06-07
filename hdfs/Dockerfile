FROM debian:jessie

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV HDP_VERSION=2.4.2.0
ENV HDFS_USER=hdfs
ENV HADOOP_GROUP=hadoop
ENV DFS_NAME_DIR="/grid/hadoop/hdfs/nn /grid1/hadoop/hdfs/nn"
ENV DFS_DATA_DIR="/grid/hadoop/hdfs/dn /grid1/hadoop/hdfs/dn /grid2/hadoop/hdfs/dn"
ENV FS_CHECKPOINT_DIR="/grid/hadoop/hdfs/snn /grid1/hadoop/hdfs/snn /grid2/hadoop/hdfs/snn"
ENV HDFS_LOG_DIR=/var/log/hadoop/${HDFS_USER}
ENV HDFS_PID_DIR=/var/run/hadoop/${HDFS_USER}
ENV HADOOP_CONF_DIR=/etc/hadoop/conf
ENV HDP_SCRIPTS_DIR=/hdp/scripts
ENV JAVA_PATH=/usr/java
ENV JAVA_HOME=${JAVA_PATH}/default
ENV PATH=${PATH}:${JAVA_HOME}/bin


# Add hdp repo list
ADD http://public-repo-1.hortonworks.com/HDP/debian7/2.x/updates/${HDP_VERSION}/hdp.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys B9733A7A07513CAD
RUN apt-get update


# Install hadoop stuff
RUN apt-get install -y hadoop-hdfs libhdfs0 hadoop-client openssl \
                       libsnappy1 libsnappy-dev \
                       liblzo2-2 liblzo2-dev hadooplzo \
                       curl


# Install java
RUN mkdir -p ${JAVA_PATH}
RUN cd ${JAVA_PATH} && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz \
    | tar xz -C ${JAVA_PATH}
RUN mv ${JAVA_PATH}/jdk1.8.0_92 ${JAVA_HOME}


# Create directories

# NameNode Directories
RUN mkdir -p ${DFS_NAME_DIR}
RUN chown -R ${HDFS_USER}:${HADOOP_GROUP} ${DFS_NAME_DIR}
RUN chmod -R 755 ${DFS_NAME_DIR}

# SecondaryNameNode Directories
RUN mkdir -p ${FS_CHECKPOINT_DIR}
RUN chown -R ${HDFS_USER}:${HADOOP_GROUP} ${FS_CHECKPOINT_DIR}
RUN chmod -R 755 ${FS_CHECKPOINT_DIR}

# DataNode Local Directories
RUN mkdir -p ${DFS_DATA_DIR}
RUN chown -R ${HDFS_USER}:${HADOOP_GROUP} ${DFS_DATA_DIR}
RUN chmod -R 750 ${DFS_DATA_DIR}

# Create the Log and PID Directories

# HDFS Logs
RUN mkdir -p ${HDFS_LOG_DIR}
RUN chown -R ${HDFS_USER}:${HADOOP_GROUP} ${HDFS_LOG_DIR}
RUN chmod -R 755 ${HDFS_LOG_DIR}

# HDFS Process
RUN mkdir -p ${HDFS_PID_DIR}
RUN chown -R ${HDFS_USER}:${HADOOP_GROUP} ${HDFS_PID_DIR}
RUN chmod -R 755 ${HDFS_PID_DIR}


# Copy scripts
RUN mkdir -p ${HDP_SCRIPTS_DIR}
ADD scripts/* ${HDP_SCRIPTS_DIR}/
RUN chmod a+x ${HDP_SCRIPTS_DIR}/datanode-start.sh
RUN chmod a+x ${HDP_SCRIPTS_DIR}/namenode-format.sh
RUN chmod a+x ${HDP_SCRIPTS_DIR}/namenode-start.sh
RUN chmod a+x ${HDP_SCRIPTS_DIR}/secondary-namenode-start.sh


# Mount hadoop configs
VOLUME ${HADOOP_CONF_DIR}
