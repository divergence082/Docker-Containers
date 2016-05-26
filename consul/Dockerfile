FROM alpine:3.3

RUN mkdir -p /consul/data /consul/ui /consul/config

ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_linux_amd64.zip /tmp/consul.zip
RUN cd /bin && \
    unzip /tmp/consul.zip && \
    chmod +x /bin/consul && \
    rm /tmp/consul.zip

ADD https://releases.hashicorp.com/consul/0.6.4/consul_0.6.4_web_ui.zip /tmp/webui.zip
RUN cd /consul/ui && \
    unzip /tmp/webui.zip && \
    rm /tmp/webui.zip

VOLUME ["/consul/data"]
VOLUME ["/consul/config"]

ENTRYPOINT ["/bin/consul", "agent", "-config-file=/consul/config/consul.json"]
