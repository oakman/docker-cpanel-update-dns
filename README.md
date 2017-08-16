# Usage

Dockerization of the project [cPanel-Update-Dns](https://github.com/birkoss/cPanel-Update-Dns) and adds functionality for doing the DNS update in a cron schedule.

```
docker run \
  --rm \
  -it \
  -e USERNAME="<username goes here>" \
  -e PASSWORD="<password goes here>" \
  -e CPANEL_HOST="<cpanel hostname goes here>" \
  -e CPANEL_PORT="<cpanel port goes here>" \
  -e CRONTASK_1="0 * * * * python /opt/cpanel-update-dns/updatedns.py --name test.example.com --domain example.com --type A --ttl 7200 >/dev/null 2>&1" \
  -e CRONTASK_2="0 * * * * python /opt/cpanel-update-dns/updatedns.py --name www.example.com --domain example.com --type A --ttl 7200 >/dev/null 2>&1" \
  -e CRONTASK_3="0 * * * * python /opt/cpanel-update-dns/updatedns.py --name ftp.example.com --domain example.com --type A --ttl 7200 >/dev/null 2>&1" \
  cpanel-update-dns:latest
```

The above command updates the DNS entry with the correct external IP adress every hour.
