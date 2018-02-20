#!/bin/sh

cd ~/openvpn-ca
source vars
./clean-all
./build-ca
./build-key-server server
./build-dh && openvpn --genkey --secret keys/ta.key
