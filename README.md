#### xip-pdns

This is the source of the [PowerDNS](http://powerdns.com/) pipe backend adapter powering [xip.io](http://xip.io/).

Install this on your system, adjust [etc/xip-pdns.conf](etc/xip-pdns.conf.example) to your liking, and configure PowerDNS as follows:

    launch=pipe
    pipe-command=/path/to/xip-pdns/bin/xip-pdns /path/to/xip-pdns/etc/xip-pdns.conf

