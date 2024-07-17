# Home Server Setup
My home server setup on ayilmaz.xyz

I don't provide some parts since it is personal and might cause vulnerabilities.

## Docker
### Mail Server
[A production-ready fullstack but simple containerized mail server.](https://github.com/docker-mailserver/docker-mailserver) \
I host all my xxx@ayilmaz.xyz mails with this.
### Nextcloud AIO
[The official Nextcloud installation method. Provides easy deployment and maintenance with most features included in this one Nextcloud instance.](https://github.com/nextcloud/all-in-one) \
I host my nextcloud server via Docker and it is really easy to setup.

### Pi-Hole Docker
[Pi-hole in a docker container](https://github.com/pi-hole/docker-pi-hole) \
I host pihole for ad, scam and telemetry blocking.

My adlists:
```
https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts (default)
https://raw.githubusercontent.com/blocklistproject/Lists/master/malware.txt
https://raw.githubusercontent.com/blocklistproject/Lists/master/tracking.txt
https://raw.githubusercontent.com/blocklistproject/Lists/master/scam.txt
https://raw.githubusercontent.com/blocklistproject/Lists/master/phishing.txt
```