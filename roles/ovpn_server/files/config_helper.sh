#!/bin/bash'
cd /root/openvpn-ca/
source vars
./build-key $1
cd /root/client-configs
./make_config.sh $1
