#!/bin/bash
# A sample shell script to print domain ip address hosting information such as
# Location of server, city, ip address owner, country and network range.
# This is useful to track spammers or research purpose.
# -------------------------------------------------------------------------
 
# Get all domains
_dom=$@
 
# Die if no domains are given
[ $# -eq 0 ] && { echo "Usage: $0 domain1.com domain2.com ..."; exit 1; }
for d in $_dom
do
	_ip=$(host $d | grep 'has add' | head -1 | awk '{ print $4}')
	[ "$_ip" == "" ] && { echo "Error: $d is not valid domain or dns error."; continue; }
	echo "Getting information for domain: $d [ $_ip ]..."
	whois "$_ip" | egrep -w 'OrgName:|City:|Country:|OriginAS:|NetRange:'
	echo ""
done
