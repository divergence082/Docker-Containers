FROM alpine:3.3

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_CONSUL_VERSION=0.6.4
ENV ENV_CONSUL_WORKDIR=/consul
ENV ENV_CONSUL_UI_DIR=${ENV_CONSUL_WORKDIR}/ui
ENV ENV_CONSUL_DATA_DIR=${ENV_CONSUL_WORKDIR}/data
ENV ENV_CONSUL_CONFIG_DIR=${ENV_CONSUL_WORKDIR}/config

# Create necessary folders
WORKDIR ${ENV_CONSUL_WORKDIR}
RUN mkdir -p ${ENV_CONSUL_DATA_DIR} ${ENV_CONSUL_UI_DIR}

# Download and install consul
ADD https://releases.hashicorp.com/consul/${ENV_CONSUL_VERSION}/consul_${ENV_CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && \
    unzip /tmp/consul.zip && \
    chmod +x /bin/consul && \
    rm /tmp/consul.zip

# Download and install consul-ui
ADD https://releases.hashicorp.com/consul/${ENV_CONSUL_VERSION}/consul_${ENV_CONSUL_VERSION}_web_ui.zip /tmp/webui.zip
RUN cd ${ENV_CONSUL_UI_DIR} && \
    unzip /tmp/webui.zip && \
    rm /tmp/webui.zip

# Mount necessary folders
VOLUME ${ENV_CONSUL_CONFIG_DIR}

# Run
ENTRYPOINT /bin/consul agent -config-file=${ENV_CONSUL_CONFIG_DIR}/consul.json
