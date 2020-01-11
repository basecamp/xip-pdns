# xip-pdns

- based on [xip.io](https://github.com/basecamp/xip-pdns)
- Add AAAA record 
- Remove Base36  

## Basis
This is a piped backend provider using [PowerDNS](http://powerdns.com/) powering [xip.ninja](http://xip.ninja/).

## Installation

#### Install powerdns
```
sudo apt install pdns-server
sudo apt install pdns-backend-pipe
```
### Pull down source
Clone this git repo to somewhere accessible

#### Adjust pdns configuration to use a pipe backend
Open /etc/powerdns/pdns.conf and make these adjustments.

```
launch=pipe
pipe-command=/path/to/xip-pdns/bin/xip-pdns /path/to/xip-pdns/etc/xip-pdns.conf
```

#### Application
This will only respond to dns requests that end in xip.ninja.

Effectively if you ask for 1.2.3.4.xip.ninja it will return 1.2.3.4 as the IP address. 

#### More information 

visit [xip.ninja](http://xip.ninja/). 
