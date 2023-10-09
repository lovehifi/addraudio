#!/bin/bash

# Check if the nfs line exists in /etc/fstab
if ! grep -q "nfs" /etc/fstab; then
    echo "Adding default nfs line to /etc/fstab"
    echo -e "11.22.33.44:/DSD  /mnt/MPD/NAS/DSD  nfs   defaults,noauto,bg,soft,timeo=5  0  0" >> /etc/fstab
else
    echo "NFS OK"
fi

ip_address=$(cat /boot/ip.ini)
dynamic_ip=$(ping -c 1 -W 10 "$ip_address" | awk -F'[()]' '/PING/{print $2}')
echo "NewIP: $dynamic_ip"

if grep -q "nfs" /etc/fstab; then
    sed -i "s/^[[:space:]]*[0-9.]\+\s*:/$dynamic_ip:/" /etc/fstab
fi
