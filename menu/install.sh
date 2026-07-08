#!/bin/bash

echo "[INFO] Installing Menu..."

mkdir -p /usr/local/sbin

cat > /usr/local/sbin/menu << 'MENU'
#!/bin/bash
clear
echo "=================================="
echo "      SANGGAR VPN MENU"
echo "=================================="
echo "1. SSH Menu"
echo "2. XRAY Menu"
echo "0. Exit"
echo "=================================="
read -p "Select Menu : " x

case $x in
1) mssh ;;
2) mxray ;;
0) exit ;;
*) echo "Invalid";;
esac
MENU

chmod +x /usr/local/sbin/menu

echo "[INFO] Menu installed."
