FROM debian:wheezy

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV CONFIG_DIR=/etc/hadoop/conf.my_cluster
ENV SCRIPTS_DIR=/scripts
ENV JAVA_HOME=/opt/jdk
ENV PATH=${PATH}:${JAVA_HOME}/bin


# Add repo list
RUN echo "deb http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh wheezy-cdh5 contrib" > /etc/apt/sources.list.d/cloudera.list
RUN echo "deb-src http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh wheezy-cdh5 contrib" >> /etc/apt/sources.list.d/cloudera.list
ADD http://archive.cloudera.com/cdh5/debian/wheezy/amd64/cdh/archive.key /tmp/archive.key
RUN cat /tmp/archive.key | apt-key add -
ADD http://archive.cloudera.com/gplextras5/ubuntu/precise/amd64/gplextras/cloudera.list /etc/apt/sources.list.d/gplextras.list.
RUN apt-get update


# Install cdh components
RUN apt-get install -y hadoop-yarn-resourcemanager hadoop-yarn-nodemanager \
                       hadoop-hdfs hadoop-hdfs-namenode hadoop-hdfs-secondarynamenode hadoop-hdfs-datanode \
                       hadoop-client curl procps

# Download and unarchive Java
RUN mkdir -p /opt && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz \
    | tar -xzf - -C /opt && \
    ln -s /opt/jdk1.8.0_92 /opt/jdk

# Configurations
RUN mkdir -p ${CONFIG_DIR}
RUN update-alternatives --install /etc/hadoop/conf hadoop-conf ${CONFIG_DIR} 50
RUN update-alternatives --set hadoop-conf ${CONFIG_DIR}
RUN update-alternatives --display hadoop-conf

# Copy scripts
RUN mkdir -p ${SCRIPTS_DIR}
ADD scripts/* ${SCRIPTS_DIR}/
RUN chmod a+x ${SCRIPTS_DIR}/datanode-start.sh
RUN chmod a+x ${SCRIPTS_DIR}/namenode-start.sh
RUN chmod a+x ${SCRIPTS_DIR}/namenode-upgrade.sh
RUN chmod a+x ${SCRIPTS_DIR}/secondary-namenode-start.sh

RUN chown -R hdfs:hadoop /var/log/hadoop-hdfs

# Mount configs
VOLUME ${CONFIG_DIR}

