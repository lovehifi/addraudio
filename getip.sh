#!/bin/bash

if [[ -e "/boot/ip.ini" ]]; then
    if ! grep -q "nfs" /etc/fstab; then
        echo "Adding default nfs line to /etc/fstab"
        #sed -i '$!N;/\n$/!P;D' /etc/fstab
		dirmount"volume2/DSD"
		dirnas="/mnt/MPD/NAS/DSD"			
		mountpoint="$dirnas"
		mkdir -p $mountpoint
		chown mpd:audio "$mountpoint"
        echo -e "11.22.33.44:/$dirmount  $mountpoint  nfs   defaults,noauto,bg,soft,timeo=5  0  0" >> /etc/fstab
		
    else
        echo "NFS OK"
    fi

    ip_address=$(cat /boot/ip.ini)
    ping_result=$(ping -c 1 -W 3 "$ip_address")

    if [[ $? -eq 0 ]]; then
        dynamic_ip=$(echo "$ping_result" | awk -F'[()]' '/PING/{print $2}')
        echo "get IP: $dynamic_ip"

        if grep -q "nfs" /etc/fstab; then
            sed -i "s/^[[:space:]]*[0-9.]\+:/$dynamic_ip:/" /etc/fstab
        fi
		systemctl daemon-reload
		mount $mountpoint
    else
        echo "Unable to ping $ip_address. Skipping IP replacement."
    fi
else
    echo "File /boot/ip.ini not found. Skipping NFS configuration."
fi

