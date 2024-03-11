#!/bin/sh
script_dir="/tmp/opt/home"
target_country_name="Hong Kong|China|Singapore"
if [ "$1" == "-h" ];then
	echo "  Ban IPs from a file."
	echo "  Usage:"
	echo "    -h show this help."
	echo "    -g generate CS2 ban IPs."
	echo "    -b [IP file] ban IPs from file."
	echo "    -u [IP file] unban IPs from file."
	exit 0
fi

if [ "$1" == "-g" ];then
	curl "https://api.steampowered.com/ISteamApps/GetSDRConfig/v1/?appid=730" -o ${script_dir}/cs2_ips.json
	if [ -f ${script_dir}/cs2_ips.json ];then
		region_code=$( sh JSON.sh -b < ${script_dir}/cs2_ips.json | awk -v regex="${target_country_name}" -F'"' '( $6 == "desc" && $8 ~ regex ) {print $4}' | sed ':a;N;$!ba;s/\n/|/g')
		sh JSON.sh -b < ${script_dir}/cs2_ips.json | awk -v regex=${region_code} -F'"' '( $4 ~ regex && $6 == "relays" && $8 == "ipv4" && $12 != "port_range") {print $10}' > ${script_dir}/cs2_ips
		rm ${script_dir}/cs2_ips.json
	fi
	exit 0
fi

if [ "$1" == "-b" ] && [ -f ${script_dir}/$2 ];then
	while read IPset;do
		iptables -C FORWARD -s $IPset -j DROP||iptables -I FORWARD -s $IPset -j DROP
	done < ${script_dir}/$2
	exit 0
fi

if [ "$1" == "-u" ] && [ -f ${script_dir}/$2 ];then
	while read IPset;do
		iptables -D FORWARD -s $IPset -j DROP
	done < ${script_dir}/$2
	exit 0
fi
