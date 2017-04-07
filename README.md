# OpenBSD-Namecheap-DDNS #

## Description ##

Small script for updating DDNS record on Namecheap, written for use on OpenBSD.

## Requirements ##

* curl (`7.53.1`; the pre-compiled package on OpenBSD is fine).

## Installation ##

0. Download the script.
1. Update configurations in the script.

## Usage ##

There are a number of configurations should be updated before using:

* `domain`: Domain name.
* `password`: Dynamic DNS password.
* `host`: Host. `@` for the domain itself.
* `log`: Log file. Default to ddns.log placed next to the script.

A cron job can be setup to run the script periodically. For example, add a cron job by `crontab -e`:

    # Run the script located at /path/to/update.sh every 1 hour.
    0 * * * * /path/to/update.sh

## License ##

[The BSD 3-Clause License](http://opensource.org/licenses/BSD-3-Clause)
