#!/bin/sh

# config trojan
cat << EOF > /etc/trojan-go/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "$PASSWORD"
    ],
    "websocket": {
        "enabled": true,
        "path": "/",
        "host": ""
    }
}
EOF

# run trojan
/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
