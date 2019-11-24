#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

CUR_IP=$(cat /config/config.boot | grep 213.75.112.0/21 -A1 | grep next-hop | awk '{ print $2}');

NEW_IP=$(run show dhcp client leases | grep router | awk '{ print $3 }');
iptv_static=$(echo "set protocols static route 213.75.112.0/21 next-hop $NEW_IP")

if [ "$CUR_IP" = "$NEW_IP" ]; then
echo Addresses the same
exit 1; fi

configure
delete protocols static route 213.75.112.0/21
eval $iptv_static
commit
save
exit
restart igmp-proxy