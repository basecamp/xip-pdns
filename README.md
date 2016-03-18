# XIP PowerDNS Backend Adapter

This is the source of the [PowerDNS](http://powerdns.com/) pipe backend 
adapter powering [xip.io](http://xip.io/).

## Deploying Manually

Copy `etc/xip-pdns.conf.example` to `/etc/xip-pdns.conf`, and modify to meet 
your needs.  

Example: 

**/etc/xip-pdns.conf**

```
# Increment this timestamp when the contents of the file change.
XIP_TIMESTAMP="2014102800"

# The top-level domain for which the name server is authoritative.
XIP_DOMAIN="xip.test"

# The public IP addresses (e.g. for the web site) of the top-level domain.
# `A` queries for the top-level domain will return this list of addresses.
XIP_ROOT_ADDRESSES=( "1.2.3.1" )

# The public IP addresses on which this xip-pdns server will run.
# `NS` queries for the top-level domain will return this list of addresses.
# Each entry maps to a 1-based subdomain of the format `ns-1`, `ns-2`, etc.
# `A` queries for these subdomains map to the corresponding addresses here.
XIP_NS_ADDRESSES=( "1.2.3.4" "1.2.3.5" )

# How long responses should be cached, in seconds.
XIP_TTL=300
```

Then copy `etc/xip-pdns.backend.conf.example` to 
`/etc/powerdns/pdns.d/xip.conf` (or the appropriate PowerDNS backend adapter 
configuration location for your system), and modify to meet your needs.

Example: 

**/etc/powerdns/pdns.d/xip.conf**

```
launch=pipe
pipe-command=/usr/local/bin/xip-pdns /etc/xip-pdns.conf
```

Finally, copy `bin/xip-pdns` to `/usr/local/bin/xip-pdns` (or wherever you 
prefer).

Restart PowerDNS, and test.

```
$ dig test.10.0.0.1.xip.test @localhost
;; ANSWER SECTION:
test.10.0.0.1.xip.test. 300     IN      A       10.0.0.1
```

*Note: Replace `localhost` with the address of the host running PowerDNS.*

## Deploying with Docker

XIP PDNS can easily be deployed with the included Dockerfile as follows.  
First copy `etc/xip-pdns.conf.example` to `/path/to/xip-pdns.conf` (wherever 
you want it), and modify for your needs.   Build, and run with Docker:

```
$ cp -a etc/xip-pdns.conf.example etc/xip-pdns.conf

$ docker build -t 'xip-pdns' .

$ docker run -it \
    -p 0.0.0.0:53:53/tcp \
    -p 0.0.0.0:53:53/udp \
    -v ./etc/xip-pdns.conf:/etc/xip-pdns.conf \
    xip-pdns
```

Alternatively, the above can be run with Docker Compose using the included
`docker-compose.yml`:

```
$ docker-compose up
```

And test:

```
$ dig test.10.0.0.1.xip.test @localhost
;; ANSWER SECTION:
test.10.0.0.1.xip.test. 300     IN      A       10.0.0.1
```

*Note: Replace `localhost` with the host running the Docker container.*
