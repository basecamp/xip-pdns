#### xip-pdns

This is the source of the [PowerDNS](http://powerdns.com/) pipe backend adapter powering [xip.ninja](http://xip.ninja/).

Install this on your system, adjust [etc/xip-pdns.conf](etc/xip-pdns.conf.example) to your liking, and configure PowerDNS as follows:

    launch=pipe
    pipe-command=/path/to/xip-pdns/bin/xip-pdns /path/to/xip-pdns/etc/xip-pdns.conf

- based on [xip.io](https://github.com/basecamp/xip-pdns)
- I've had AAAA record support 
