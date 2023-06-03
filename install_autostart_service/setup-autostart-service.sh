#!/bin/bash

#move to dir
cd "$(dirname "$0")"

#add service & activate
sudo cp -r ../../PIA-openvpn-qbittorrent-port-forward-script/ /usr/local/bin/PIA-openvpn-qbittorrent-port-forward-script/
sudo cp pia-openvpn-qbittorrent-port-bind.service /etc/systemd/system/pia-openvpn-qbittorrent-port-bind.service
sudo systemctl daemon-reload
sudo systemctl start pia-openvpn-qbittorrent-port-bind.service
sudo systemctl enable pia-openvpn-qbittorrent-port-bind.service

#print test
sudo systemctl status pia-openvpn-qbittorrent-port-bind.service