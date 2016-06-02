FROM alpine:3.3

MAINTAINER divergence082 <divergence082@gmail.com>

# Set environment variables
ENV ENV_CONSUL_VERSION=0.6.4
ENV ENV_CONSUL_UI_DIR=/consul/ui
ENV ENV_CONSUL_DATA_DIR=/consul/data
ENV ENV_CONSUL_CONFIG_DIR=/consul/config

# Install utils
RUN apk add --update py-pip && pip install envtpl

# Create necessary folders and files
WORKDIR /consul
RUN mkdir -p ${ENV_CONSUL_DATA_DIR} ${ENV_CONSUL_UI_DIR}

# Organize configs
ADD config/consul.json.tpl ${ENV_CONSUL_CONFIG_DIR}/
RUN envtpl < ${ENV_CONSUL_CONFIG_DIR}/consul.json.tpl > ${ENV_CONSUL_CONFIG_DIR}/consul.json
RUN cat ${ENV_CONSUL_CONFIG_DIR}/consul.json

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

# Run consul
ENTRYPOINT /bin/consul agent -config-file=${ENV_CONSUL_CONFIG_DIR}/consul.json
