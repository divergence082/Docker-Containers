FROM alpine:3.3

MAINTAINER divergence082

# Set environment variables
ENV CONSUL_VERSION=0.6.4

# Create necessary folders
WORKDIR /consul
RUN mkdir -p /consul/data /consul/ui

# Download and install consul
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && \
    unzip /tmp/consul.zip && \
    chmod +x /bin/consul && \
    rm /tmp/consul.zip

# Download and install consul-ui
ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_web_ui.zip /tmp/webui.zip
RUN cd /consul/ui && \
    unzip /tmp/webui.zip && \
    rm /tmp/webui.zip

# Mount necessary folders
VOLUME ["/consul/config"]

# Run consul
ENTRYPOINT ["/bin/consul", "agent", "-config-file=/consul/config/consul.json"]
