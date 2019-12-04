#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

if cat /config/config.boot | grep -q "dhcp-interface eth0.6"; then 
    configure
    delete vpn l2tp remote-access dhcp-interface eth0.6
    set vpn l2tp remote-access outside-address 0.0.0.0
    commit
    save
    exit
else 
   echo VPN OK
fi