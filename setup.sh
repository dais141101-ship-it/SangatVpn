#!/bin/bash
clear
echo "=================================="
echo "      SANGGAR VPN INSTALLER"
echo "=================================="

bash ssh/install.sh
bash xray/install.sh
bash websocket/install.sh
bash menu/install.sh

echo
echo "Install selesai."
