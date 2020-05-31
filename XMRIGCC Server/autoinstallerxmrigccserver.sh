#!/bin/bash
port=$1
username=$2
password=$3
token=$4

sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test && sudo apt-get update && sudo apt-get install -y  hwloc cpulimit libhwloc-dev git build-essential cmake libuv1-dev libmicrohttpd-dev git make unzip htop git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev wget software-properties-common && cd ~/ && git clone https://github.com/Bendr0id/xmrigCC.git && cd xmrigCC && cmake . -DWITH_CC_SERVER=ON && make && sudo sysctl -w vm.nr_hugepages=2048 || echo "hugepages set to 2gb" && wget https://raw.githubusercontent.com/fuzzle20/xmrigcc_autoinstaller/master/XMRIGCC%20Server/config_cc_template.json && cp config_cc_template.json config_cc.json


# Define Configuration Line
line_port="\"port\": $port,"
line_username="\"user\": \"$username\","
line_password="\"pass\": \"$password\","
line_token="\"access-token\": \"$token\","


#Replace Config
sudo sed -i "/\"port\": /c $line_port" config_cc.json
sudo sed -i "/\"user\": /c $line_username" config_cc.json
sudo sed -i "/\"pass\": /c $line_password" config_cc.json
sudo sed -i "/\"access-token\": /c $line_token" config_cc.json

