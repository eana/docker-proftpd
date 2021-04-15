docker-proftpd
==============

Simple way to install a proftp server on an host.

Build the image
---------------

```bash
$ docker build -t proftpd https://github.com/eana/docker-proftpd
```

Quick start
-----------

```bash
$ docker run --name proftpd -d \
    -p 20-21:20-21 \
    -p 21000-21020:21000-21020 \
    -e USERNAME=username \
    -e PASSWORD='your_super_secret_and_password' \
    -v /data/torrents:/ftp \
    --restart=always \
    proftpd
```

docker-compose.yml example
--------------------------

```yaml
---
version: "3.8"
services:
  proftpd:
    build: github.com/eana/docker-proftpd
    container_name: qbt_proftpd
    environment:
      - USERNAME=myusername
      - PASSWORD=mypassword
    ports:
      - 20-21:20-21
      - 21000-21020:21000-21020
    volumes:
      - ./downloads:/ftp
    network_mode: host
    restart: always
```

Connect to the server
---------------------

```
$ ncftp -u myusername localhost
NcFTP 3.2.5 (Feb 02, 2011) by Mike Gleason (http://www.NcFTP.com/contact/).
Connecting to 127.0.0.1...
ProFTPD Server (compxtreme.ro) [::ffff:127.0.0.1]
Logging in...
Password requested by 127.0.0.1 for user "myusername".

    Password required for myusername

Password: **********

User myusername logged in
Logged in to localhost.
ncftp / >
```
