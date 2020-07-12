#!/bin/bash
#
# Reset a local blockchain state and resync

set -o errexit

echo "Stopping node..."
sudo systemctl stop iqcash

echo "Removing local blockchain state"
sudo rm -rf /home/iqcash/.iqcashcore/chainstate/
sudo rm -rf /home/iqcash/.iqcashcore/blocks/
sudo rm -rf /home/iqcash/.iqcashcore/database/
sudo rm -f /home/iqcash/.iqcashcore/banlist.dat
sudo rm -f /home/iqcash/.iqcashcore/mncache.dat
sudo rm -f /home/iqcash/.iqcashcore/mnpayments.dat
sudo rm -f /home/iqcash/.iqcashcore/governance.dat
sudo rm -f /home/iqcash/.iqcashcore/peers.dat

echo "Starting node..."
sudo systemctl start iqcash

echo "Reset completed!"
echo "Node is now resyncing with the network. It could take some time, usually 15-40 min."
