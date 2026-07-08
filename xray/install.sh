#!/bin/bash

clear
echo "=================================="
echo "      INSTALL XRAY CORE"
echo "=================================="

apt update
apt install -y curl wget unzip

mkdir -p /etc/xray
mkdir -p /var/log/xray

touch /var/log/xray/access.log
touch /var/log/xray/error.log

echo "$(cat ~/domain)" >/etc/xray/domain

cat >/etc/xray/config.json <<'EOF'
{
  "log": {
    "access": "/var/log/xray/access.log",
    "error": "/var/log/xray/error.log",
    "loglevel": "warning"
  },

  "inbounds": [

    {
      "port": 443,
      "protocol": "vmess",
      "settings": {
        "clients": [
          // #vmess
        ]
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/vmess"
        }
      }
    },

    {
      "port": 8443,
      "protocol": "vless",
      "settings": {
        "clients": [
          // #vless
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/vless"
        }
      }
    },

    {
      "port": 2083,
      "protocol": "trojan",
      "settings": {
        "clients": [
          // #trojan
        ]
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "/trojan"
        }
      }
    }

  ],

  "outbounds": [
    {
      "protocol":"freedom"
    }
  ]
}
EOF

echo ""
echo "Config berhasil dibuat."
