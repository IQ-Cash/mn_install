#!/bin/bash
# Tested with Ubuntu 16.04, 18.04

set -o errexit

echo "Stopping node..."
sudo systemctl stop iqcash

echo "Downloading new version..."
sudo wget https://github.com/IQ-Cash/iqcash/releases/download/v0.8.3.2/iqcash-cli-linux.tar.gz --directory-prefix /home/iqcash/ -O /home/iqcash/iqcash-cli-linux-v0.8.3.2.tar.gz

echo "Extracting..."
sudo tar -xzvf /home/iqcash/iqcash-cli-linux-v0.8.3.2.tar.gz -C /home/iqcash/
sudo chown -R iqcash:iqcash /home/iqcash/iqcash* && sudo chmod 755 /home/iqcash/iqcash*
sudo rm /home/iqcash/iqcash-cli-linux-v0.8.3.2.tar.gz

echo "Starting node..."
sudo systemctl start iqcash

echo "========================================="
echo "Masternode upgrade to v0.8.3.2 completed!"
