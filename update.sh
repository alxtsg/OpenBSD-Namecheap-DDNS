#!/bin/sh
#
# Script for updating DNS records on Namecheap.
# Author: Alex Tsang <alextsang@live.com>
# License: The 3-Clause BSD License

# Strict mode.
set -e
set -u

scriptDirectory="$(cd "$(dirname "$0")"; pwd)"
domainsDirectory="${scriptDirectory}/configs"
logsDirectory="${scriptDirectory}/logs"

apiURL="https://dynamicdns.park-your-domain.com/update"

configurations=$(ls "${domainsDirectory}")
for configuration in ${configurations}; do
  filePath="${domainsDirectory}/${configuration}"
  # Ignore anything other than regular files, such as directories.
  if [ ! -f "${filePath}" ]; then
    continue
  fi

  domain=
  password=
  host=
  log=

  . "${filePath}"

  url="${apiURL}?domain=${domain}&password=${password}&host=${host}"

  (
    # Log update time.
    date -u '+%Y-%m-%dT%H:%M:%SZ'

    # -M: Disable progress meter.
    # -o -: Set stdout as output.
    # -U '': Remove default value of HTTP request header User-Agent.
    ftp -M -o - -U '' "${url}"

    # New line.
    echo ''
  ) >> "${logsDirectory}/${log}"
done
