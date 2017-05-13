#!/bin/sh
# Script for updating DDNS record on Namecheap.
# Author: Alex Tsang <alextsang@live.com>
# License: The 3-Clause BSD License

# Strict mode.
set -e
set -u
IFS='\n\t'

SCRIPT_DIR="$(cd "$(dirname "$0")"; pwd)"

API_URL="https://dynamicdns.park-your-domain.com/update"

# Configurations.
#
# domain: Domain name.
# password: Dynamic DNS password.
# host: Host.
# log: Log file.
domain='example.com'
password='password'
host="@"
log="${SCRIPT_DIR}"/ddns.log

url="${API_URL}?domain=${domain}&password=${password}&host=${host}"

cd "${SCRIPT_DIR}"

{
  # Log update time.
  date -u '+%Y-%m-%dT%H:%M:%SZ'

  # -M: Disable progress meter.
  # -o -: Set stdout as output.
  # -U '': Remove default value of HTTP request header User-Agent.
  ftp -M -o - -U '' "${url}"

  # New line.
  echo ''
} >> "${log}"
