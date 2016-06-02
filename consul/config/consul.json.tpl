{
    "data_dir": "{{ ENV_CONSUL_DATA_DIR }}",
    "ui_dir": "{{ ENV_CONSUL_UI_DIR }}",
    "log_level": "{{ ENV_CONSUL_LOG_LEVEL | default('warn') }}",
    "client_addr": "{{ ENV_CONSUL_CLIENT_ADDR | default('0.0.0.0') }}",
    "bind_addr": "{{ ENV_CONSUL_BIND_ADDR | default('127.0.0.1') }}",
    "ports": {
        "dns": {{ ENV_CONSUL_DNS_PORT | default(8600) }},
        "http": {{ ENV_CONSUL_HTTP_PORT | default(8500) }},
        "https": {{ ENV_CONSUL_HTTPS_PORT | default(-1) }},
        "rpc": {{ ENV_CONSUL_RPC_PORT | default(8400) }},
        "serf_lan": {{ ENV_CONSUL_SERF_LAN_PORT | default(8301) }},
        "serf_wan": {{ ENV_CONSUL_SERF_WAN_PORT | default(8302) }},
        "server": {{ ENV_CONSUL_SERVER_PORT | default(8300) }}
    },
    "dns_config": {
        "allow_stale": {{ ENV_CONSUL_ALLOW_STALE_DNS_CONFIG | default('true') }},

        {% if ENV_CONSUL_ALLOW_STALE_DNS_CONFIG is defined and
              ENV_CONSUL_ALLOW_STALE_DNS_CONFIG == 'true' or
              ENV_CONSUL_ALLOW_STALE_DNS_CONFIG is not defined
        %}
        "max_stale": "{{ ENV_CONSUL_MAX_STALE_DNS_CONFIG | default('5s') }}",
        {% endif %}

        "node_ttl": "{{ ENV_CONSUL_NODE_TTL_DNS_CONFIG | default('0s') }}",
        "service_ttl": {
            "*": "{{ ENV_CONSUL_SERVICE_TTL_ALL | default('0s') }}"
        },
        "enable_truncate": {{ ENV_CONSUL_ENABLE_TRUNCATE_DNS_CONFIG | default('false') }},
        "only_passing": {{ ENV_CONSUL_ONLY_PASSING_DNS_CONFIG | default('false') }}
    },
    "reap": {{ ENV_CONSUL_REAP | default('true') }},
    "disable_remote_exec": {{ ENV_CONSUL_DISABLE_REMOTE_EXEC | default('true') }},
    "disable_update_check": {{ ENV_CONSUL_DISABLE_UPDATE_CHECK | default('true') }}
}