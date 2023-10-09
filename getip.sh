#!/bin/bash

# Check if the nfs line exists in /etc/fstab
if ! grep -q "nfs" /etc/fstab; then
    echo "Adding default nfs line to /etc/fstab"
    sed -i '$!N;/\n$/!P;D' /etc/fstab # Remove trailing empty lines
    echo -e "\n11.22.33.44:/DSD  /mnt/MPD/NAS/DSD  nfs   defaults,noauto,bg,soft,timeo=5  0  0\n" >> /etc/fstab
else
    echo "NFS OK"
fi

ip_address=$(cat /boot/ip.ini)
ping_result=$(ping -c 1 -W 3 "$ip_address")

if [[ $? -eq 0 ]]; then
    dynamic_ip=$(echo "$ping_result" | awk -F'[()]' '/PING/{print $2}')
    echo "NewIP: $dynamic_ip"

    if grep -q "nfs" /etc/fstab; then
        sed -i "s/^[[:space:]]*[0-9.]\+:/ $dynamic_ip:/" /etc/fstab
    fi
else
    echo "Unable to ping $ip_address. Skipping IP replacement."
fi
