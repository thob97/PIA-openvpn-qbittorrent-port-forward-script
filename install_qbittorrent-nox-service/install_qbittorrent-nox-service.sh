#!/bin/bash

#move to dir
cd "$(dirname "$0")"

#update
sudo apt update 

#download
sudo wget -qO qbittorrent-nox.sh https://github.com/userdocs/qbittorrent-nox-static/releases/latest/download/x86_64-qbittorrent-nox
if [ $? -eq 0 ]; then
  sudo chmod +x qbittorrent-nox.sh
  sudo cp qbittorrent-nox.sh /usr/local/bin/qbittorrent-nox.sh
else
  echo "Download failed. Exiting."
  exit 1
fi

#add service user
sudo adduser --system --group qbittorrent-nox
sudo adduser $USER qbittorrent-nox

#add service & activate
sudo cp qbittorrent-nox.service /etc/systemd/system/qbittorrent-nox.service
sudo systemctl daemon-reload
sudo systemctl start qbittorrent-nox.service
sudo systemctl enable qbittorrent-nox.service

#print test
sudo systemctl status qbittorrent-nox.service