#!/bin/sh

apk add --update git && rm -rf /var/cache/apk/*

# pull the code for the cpanel-update-dns
mkdir -p /opt
cd /opt
git clone "https://github.com/oakman/cPanel-Update-Dns.git" cpanel-update-dns
cd /opt/cpanel-update-dns
apk del git
