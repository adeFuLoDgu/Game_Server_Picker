# Game Server Picker 
Game server picker for ASUS Router.

## Prerequisites
* Enable SSH on router.
* USB drive connected to router.

## Installation
Use SSH client and run the download command below:

    curl "https://raw.githubusercontent.com/adeFuLoDgu/Game_Server_Picker/master/JSON.sh" -o "/opt/home/JSON.sh"

    curl "https://raw.githubusercontent.com/adeFuLoDgu/Game_Server_Picker/master/ban_ips.sh" -o "/opt/home/ban_ips.sh"

## Usage
```
-h show this help.
-g generate CS2 ban IPs.
-b [IP file] ban IPs from file.
-u [IP file] unban IPs from file.
```
Example:
Generate CS2 ban IPs and ban these IPs.
```
sh /opt/home/ban_ips.sh -g
sh /opt/home/ban_ips.sh -b cs2_ips
```

## Acknowledgments
* [JSON parser](https://github.com/dominictarr/JSON.sh)
