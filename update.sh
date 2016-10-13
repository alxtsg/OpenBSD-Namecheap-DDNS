#!/bin/sh
#
# Script for updating DDNS record on Namecheap.
# Author: Alex Tsang <alextsang@live.com>
# License: The BSD 3-Clause License

# Configurations.
DOMAIN=DOMAIN-NAME.com
PASSWORD=DDNS-UPDATE-PASSWORD
HOST=@
LOG=$(cd $(dirname $0); pwd)/ddns.log

# API URL. Do not change.
API_URL="https://dynamicdns.park-your-domain.com/update"

url="${API_URL}?domain=${DOMAIN}&password=${PASSWORD}&host=${HOST}"

echo `date "+%Y%m%d-%H%M%S"` >> ${LOG}
# Disable curl's progress meter.
curl -s ${url} >> ${LOG}
echo "" >> ${LOG}
