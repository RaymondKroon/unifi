#!/bin/bash
pidof igmpproxy >/dev/null
if [[ $? -ne 0 ]] ; then
  echo "restarting igmp-proxy"
  /bin/vbash -ic 'restart igmp-proxy'
fi
