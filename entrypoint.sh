#!/bin/bash

if [ ! -d "/var/log/vpnserver/security_log" ]; then
  mkdir -p /var/log/vpnserver/security_log
  echo "create Log Directory security_log."
fi

if [ ! -d "/var/log/vpnserver/packet_log" ]; then
  mkdir -p /var/log/vpnserver/packet_log
  echo "create Log Directory packet log."
fi

if [ ! -d "/var/log/vpnserver/server_log" ]; then
  mkdir -p /var/log/vpnserver/server_log
  echo "create Log Directory server log."
fi

ln -s /var/log/vpnserver/*_log /usr/local/vpnserver/

echo "Starting Softether vpn."
exec /usr/local/vpnserver/vpnserver start
