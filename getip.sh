#!/bin/bash

# Check if the file /boot/ip.ini exists
if [[ -e "/boot/ip.ini" ]]; then
    echo "Ini file exists"
else
    # File /boot/ip.ini does not exist
    echo "File /boot/ip.ini does not exist."
    read -p "Do you want to create an ip.ini file? (yes/no): " create_ini

    if [[ "$create_ini" == "yes" ]]; then
        read -p "Enter the web address (Press Enter to use the default value harmona.dyndns-ip.com): " web_address

        # Assign default value if there's no input
        web_address=${web_address:-"harmona.dyndns-ip.com"}

        # Create content for the ip.ini file
        echo "$web_address" > /boot/ip.ini

        echo "Created ip.ini file with web address: $web_address"
    else
        # Use the default value
        web_address="harmona.dyndns-ip.com"
        echo "Using the default web address: $web_address"
    fi
fi



if [[ -e "/boot/ip.ini" ]]; then
    if ! grep -q "nfs" /etc/fstab; then
        echo "Adding default nfs line to /etc/fstab"
        #sed -i '$!N;/\n$/!P;D' /etc/fstab
		dirmount="/volume2/DSD"
		dirnas="/mnt/MPD/NAS/DSD"			
		mountpoint="$dirnas"
		mkdir -p $mountpoint
		chown mpd:audio "$mountpoint"
        echo -e "11.22.33.44:$dirmount  $mountpoint  nfs   defaults,noauto,bg,soft,timeo=5  0  0" >> /etc/fstab
		
		
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
