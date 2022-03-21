#!/bin/bash

if [ -z $1 ]; then
	echo "USAGE: $0 CONFIG_FNAME.ovpn"
	exit
fi
. ./env

docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full $1 nopass
docker run -v $OVPN_DATA:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn

