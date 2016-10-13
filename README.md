# OpenBSD-Namecheap-DDNS #

## Description ##

Small script for updating DDNS record on Namecheap, written for use on OpenBSD.

## Requirements ##

* curl (`7.49.0`; the pre-compiled package on OpenBSD is fine).

## Installation ##

0. Download the script.
1. Update configurations in the script.

## Usage ##

There are a number of configurations should be updated before using:

* `DOMAIN`: The domain name.
* `PASSWORD`: The password for updating DDNS record on Namecheap.
* `HOST`: The hostname. `@` for the domain itself.
* `LOG`: The path of update log. Default to the same directory as the script.

A cron job can be setup to run the script periodically. For example, add a cron job by `crontab -e`:

    # Run the script located at /path/to/update.sh every 1 hour.
    0 * * * * /path/to/update.sh

## License ##

[The BSD 3-Clause License](http://opensource.org/licenses/BSD-3-Clause)
