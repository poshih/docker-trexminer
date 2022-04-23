#!/bin/bash

#Define cleanup procedure
cleanup() {
    echo "Container stopped, performing cleanup..."    
    exit 0
}

#Trap SIGTERM
trap 'cleanup' SIGTERM

DISPLAY=:0 nvidia-settings -a GPUMemoryTransferRateOffsetAllPerformanceLevels=1600

sudo nvidia-smi -pm 1
sudo nvidia-smi -pl 120

SERVER=us2.ethermine.org:4444
ETH_ADDRESS=0xD1D1419EDE629923cCe568b4040Dde13C132acc1
WORKER_NAME=$HOSTNAME

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME 
