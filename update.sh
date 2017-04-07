#!/bin/sh
# Script for updating DDNS record on Namecheap.
# Author: Alex Tsang <alextsang@live.com>
# License: The BSD 3-Clause License

# Strict mode.
set -e
set -u
IFS='\n\t'

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"

API_URL="https://dynamicdns.park-your-domain.com/update"

# Configurations.
#
# DOMAIN: Domain name.
# PASSWORD: Dynamic DNS password.
# HOST: Host.
# LOG: Log file.
domain='example.com'
password='password'
host="@"
log="${SCRIPT_DIR}"/ddns.log

url="${API_URL}?domain=${domain}&password=${password}&host=${host}"

# Log update time.
date -u '+%Y-%m-%dT%H:%M:%SZ' >> "${log}"

# Disable curl's progress meter.
# Allow curl to exit with non-zero exit code.
set +e
curl -s "${url}" >> "${log}"
set -e

# New line.
echo '' >> "${log}"
