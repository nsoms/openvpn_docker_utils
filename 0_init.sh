#!/bin/bash

modprobe ip_tables
echo 'ip_tables' >> /etc/modules

. ./env

docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$SERVER_NAME
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

