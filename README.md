# PIA-openvpn-qbittorrent-port-forward-script
This repository contains scripts for PIA (Private Internet Access) VPN to bind a port and keep it in sync with qbittorrent, resulting in faster and more stable torrent connections (more seeds and peers).


The scripts for port binding are forked from the [manual-connections](https://github.com/pia-foss/manual-connections) repository. <br>
This programm adds the following **new functionalities**:
- Automatic update of the port for qbittorrent
- Automatic retrieval of a new port when port binding fails (typically after 2 months of using the same port) by requesting a new VPN connection 
- Script to add this program as a service, enabling automatic startup with the system
- Script to install qbittorrent-nox as a service, enabling automatic startup with the system
- Script to install openvpn (requires apt package manager)

## Table of Contents

* [Dependencies](#dependencies)
* [Installtion and Setup](#installtion-and-setup)
* [Install as Service](#install-as-service)
* [Further notice](#further-notice)

## Dependencies

In order for the scripts to work (probably even if you do a manual setup), you will need the following packages:
 * `curl`
 * `jq`
 * `openvpn`
 * `qbittorrent`

## Installation and Setup

To get started, clone this repository and edit the start script using the following commands:
```
git clone https://github.com/pia-foss/manual-connections.git
cd PIA-openvpn-qbittorrent-port-forward-script
nano start_pia-openvpn-qbittorrent-port-bind.sh
```
The script requires your PIA credentials to request a VPN connection and your qbittorrent credentials to access the API to update the port. 
In the next step, configure the following five variables according to your setup:
```
PIA_USER=Username
PIA_PASS=Password
QBITTORRENT_ADDRESS=127.0.0.1:8080
QBT_USER=admin
QBT_PASS=adminadmin
```
Save the file and run the start script. The script will start openvpn and bind a port. Qbittorrent needs to be started manually:
```
sudo ./start_pia-openvpn-qbittorrent-port-bind.sh 
```

## Install as Service

If you prefer not to start the script and qbittorrent manually each time you reboot your system, you can add them as systemctl services or use the provided scripts to add them automatically as services.
* To add this script as a service, run `sudo ./install_autostart_service/setup-autostart-service.sh`
* To install qbittorrent-nox as a service, run `sudo ./install_qbittorrent-nox-service/install_qbittorrent-nox-service.sh`
* To install openvpn, run `sudo ./install_openvpn/install_openvpn.sh`
* To test the vpn connection, run `sudo ./test_vpn_connections.sh`

## Further notice
* Consider modifying the "Network interface" in qbittorrent settings, so that it will only use the PIA VPN connection.
* It is recommended to enable "Reannounce to all trackers when IP or port changed" in case a new port needs to be bound.
* Make sure that the tun06 interface is free. If it is being used by something other than the openvpn connection created by this script, the script will not start.
* You might want to adjust the download path for qbittorrent to suit your preferences.
