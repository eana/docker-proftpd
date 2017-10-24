```
docker build -t github.com/eana/docker-proftpd .

docker run --name proftpd -d \
    -p 20-21:20-21 \
    -p 21000-21020:21000-21020 \
    -e USERNAME=username \
    -e PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' 'your_super_secret_and_password') \
    -v /data/torrents:/ftp \
    --restart=always \
    proftpd
```

```
ftp -p localhost 21
Name (0.0.0.0:jonas): username
Password:
ftp> ls
```
