# etcd

## Installation

base_cloud_init.yml als Userdaten einfügen.

https://linuxconfig.org/how-to-install-etcd-on-ubuntu

### Client

wget https://github.com/etcd-io/etcd/releases/download/v3.5.6/etcd-v3.5.6-linux-amd64.tar.gz
tar xvf etcd-v3.5.6-linux-amd64.tar.gz
mv etcd-v3.5.6-linux-amd64 etcd
cd etcd
sudo mv etcd etcdctl etcdutl /usr/local/bin/

### Server

sudo mkdir -p /var/lib/etcd/default
sudo mkdir /etc/etcd/

sudo chown -R ubuntu:ubuntu /var/lib/etcd

sudo touch /etc/systemd/system/etcd.service

sudo vim /etc/systemd/system/etcd.service


``` bash
[Unit]
Description=etcd - highly-available key value store
Documentation=https://etcd.io/docs
Documentation=man:etcd
After=network.target
Wants=network-online.target

[Service]
Environment=DAEMON_ARGS=
Environment=ETCD_NAME=%H
Environment=ETCD_DATA_DIR=/var/lib/etcd/default
EnvironmentFile=-/etc/default/%p
Type=notify
User=ubuntu
PermissionsStartOnly=true
#ExecStart=/bin/sh -c "GOMAXPROCS=$(nproc) /usr/bin/etcd $DAEMON_ARGS"
ExecStart=/usr/local/bin/etcd $DAEMON_ARGS
Restart=on-abnormal
#RestartSec=10s
LimitNOFILE=65536

[Install]
WantedBy=multi-user.target
Alias=etcd2.service
```

sudo systemctl daemon-reload
sudo systemctl enable etcd.service
sudo systemctl start etcd.service

## Interaction

### Write

etcdctl put foo bar

### Read

etcdctl get foo

### Delete

etcdctl del foo

### Watch

etcdctl watch foo

## Authentication

etcdctl user add root
etcdctl user grant-role root root

etcdctl user add ubuntu
etcdctl user grant-role ubuntu root
