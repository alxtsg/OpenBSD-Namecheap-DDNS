# OpenBSD-Namecheap-DDNS #

## Description ##

A small script for updating DNS records on Namecheap. Written for use on
OpenBSD.

## Requirements ##

* (None.)

## Installation ##

0. Download the script.
1. Add configuration files in the `configs` directory.

## Usage ##

Each configuration file in the `configs` directory should be a regular,
readable, non-hidden file, and contains the following properties:

* `domain`: Domain name.
* `password`: Password for updating the DNS record using the Dynamic DNS feature
provided by Namecheap.
* `host`: Host. Use `@` for the domain itself.
* `log`: Log filename. The log file is put under the `logs` directory.

A file `.example.com.config` is put under the `configs` as an example.

A cron job can be setup to run the script periodically. For example, add a cron
job by `crontab -e`:

    # Run the script located at /path/to/update.sh every 1 hour.
    0 * * * * /bin/sh /path/to/update.sh

## License ##

[The 3-Clause BSD License](http://opensource.org/licenses/BSD-3-Clause)
