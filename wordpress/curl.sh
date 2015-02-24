#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y install curl

apt-get -y autoclean
apt-get -y clean
apt-get -y autoremove
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
