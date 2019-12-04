# Setup IPTV

- Copy config.gateway.json to cloudkey `/srv/unifi/data/sites/default/`
- Copy `tvroute.sh` to USG `/config/scripts` (home folder + move + make excutable)
- Force provision USG

# Setup vpn

- Copy `fix-vpn.sh` to USG `/config/scripts`.

```
configure
delete vpn l2tp remote-access dhcp-interface eth0.6
set vpn l2tp remote-access outside-address 0.0.0.0
commit
save
exit
```