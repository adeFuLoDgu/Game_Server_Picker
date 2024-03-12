# Game Server Picker 
Game server picker for ASUS Router.

## Prerequisites
* Enable SSH on router.
* USB drive connected to router.

## Installation
Use SSH client and run the download command below:

    curl "https://raw.githubusercontent.com/adeFuLoDgu/Game_Server_Picker/main/JSON.sh" -o "/opt/home/JSON.sh"
    curl "https://raw.githubusercontent.com/adeFuLoDgu/Game_Server_Picker/main/ban_ips.sh" -o "/opt/home/ban_ips.sh"

## Usage
```
-h show this help.
-g generate CS2 ban IPs.
-b [IP file] ban IPs from file.
-u [IP file] unban IPs from file.
```
For option -g:

The default banned countries are Hong Kong, China, Singapore. If you want to change them, edit `Hong Kong|China|Singapore` of line 3 of ban_ips.sh:

    target_country_name="Hong Kong|China|Singapore"

to city or country name you want to ban (case sensitive, Valve decided name, [full json list](https://api.steampowered.com/ISteamApps/GetSDRConfig/v1/?appid=730)), join them with `|`.

Ban command example:

Generate CS2 ban IPs and ban these IPs.
```
sh /opt/home/ban_ips.sh -g
sh /opt/home/ban_ips.sh -b cs2_ips
```

## Acknowledgments
* [JSON parser](https://github.com/dominictarr/JSON.sh)
