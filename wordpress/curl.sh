#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get -qq update
apt-get -qq -y install curl

apt-get -qq -y autoclean
apt-get -qq -y clean
apt-get -qq -y autoremove
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
