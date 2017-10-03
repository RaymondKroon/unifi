#!/bin/vbash
  
# configured static route target
CUR_IP=\$(cat /config/config.boot | grep 213.75.112.0/21 -A1 | grep next-hop | awk '{ print \$2}');
  
# static route target
NEW_IP=\$(cat /var/run/dhclient_eth0.4_lease | grep new_routers | awk -F= '{print \$2}' | tr -d \');
  
if [ "\$CUR_IP" = "\$NEW_IP" ]; then
   echo Addresses the same
   exit 1;
fi
  
source /opt/vyatta/etc/functions/script-template
  
configure
delete protocols static route 213.75.112.0/21 next-hop \$CUR_IP
set protocols static route 213.75.112.0/21 next-hop \$NEW_IP
commit
save
exit
  
restart igmp-proxy
