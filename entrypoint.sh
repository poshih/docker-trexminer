#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=us2.ethermine.org:4444
ETH_ADDRESS=0xD1D1419EDE629923cCe568b4040Dde13C132acc1
WORKER_NAME=$HOSTNAME

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME 

