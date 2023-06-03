#!/bin/bash
UPDATE_PORT="$1"
QBITTORRENT_ADRESS="$2"
USERNAME="$3"
PASSWORD="$4"
#
rm -f /tmp/.cookies.txt
curl -s -b /tmp/.cookies.txt -c /tmp/.cookies.txt --header "Referer: http://$QBITTORRENT_ADRESS" --data "username=$USERNAME&password=$PASSWORD" http://$QBITTORRENT_ADRESS/api/v2/auth/login
curl -s -b /tmp/.cookies.txt -c /tmp/.cookies.txt "http://$QBITTORRENT_ADRESS/api/v2/app/setPreferences" -d 'json={"listen_port": "'"$UPDATE_PORT"'"}'
rm -f /tmp/.cookies.txt