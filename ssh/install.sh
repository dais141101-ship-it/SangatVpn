#!/bin/bash
clear

while true; do
echo "=================================="
echo "         SSH MENU"
echo "=================================="
echo "1. Create SSH Account"
echo "2. Delete SSH Account"
echo "3. List SSH Users"
echo "0. Back"
echo "=================================="
read -p "Select Menu : " sshmenu

case $sshmenu in
1)
read -p "Username : " user
read -p "Password : " pass
read -p "Expired (days): " exp

useradd -e $(date -d "$exp days" +"%Y-%m-%d") -M -s /bin/false "$user"
echo "$user:$pass" | chpasswd

echo
echo "=============================="
echo "SSH Account Created"
echo "Username : $user"
echo "Password : $pass"
echo "Expired  : $exp Days"
echo "=============================="
read -n1 -r -p "Press any key..."
;;

2)
read -p "Username : " user
userdel -r "$user" 2>/dev/null
echo "User deleted."
read -n1 -r -p "Press any key..."
;;

3)
echo
awk -F: '$3>=1000 && $7=="/bin/false"{print $1}' /etc/passwd
read -n1 -r -p "Press any key..."
;;

0)
bash ~/SangatVpn/menu/install.sh
exit
;;

*)
echo "Invalid Menu"
sleep 1
;;
esac

clear
done
