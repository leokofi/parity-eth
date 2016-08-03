#!/bin/bash
# this will start parity in private, testnet or live mode and using npm start
# lauch web ui localhost:
# typeofchain=!#
root=$HOME
# chainBlock="testnet"
dataDir="paridata"

# if [ ! $# == 1 ]; then
if [ $# -lt 1 -o $# -ge 2 ]; then
    echo "Use need to add one parimeter to the command"
    echo "e.g npm start testnet"
    echo "e.g npm start private"
    echo "e.g npm start livenet"
    exit
fi

# echo $#

if [ $# = 1 ] && [ $1 = "private" ]; then
    typeofchain=$1
    # filePath="./lib/genesis.json"
    # filePath=""
    # chainBlock="--chain $filePath"
elif [ $# = 1 ] && [ $1 = "testnet" ]; then
    typeofchain=$1
    chainBlock="--chain $1"
else
    typeofchain="livenet"
    chainBlock="--chain mainnet"
fi
# mkdir -p $root/$datadir

if [ ! -d $root/$dataDir/$typeofchain ]; then

mkdir -p $root/$dataDir/$typeofchain

echo "made the $typeofchain directory"

fi

# echo "$typeofchain is already made"

echo "trying to start this in a $typeofchain, you should be seeing synic files soon"


if [ $typeofchain = "private" ]; then

# address=0x$(parity account list | awk 'END{print}' | tr -cd '[[:alnum:]]._-')
address=0x$(parity account list | awk 'BEGIN{print}' | tr -cd '[[:alnum:]]._-')

echo "address: $address"
echo ""
echo "SINCE THIS IS A PRIVATE BLOCKCHAIN PLEASE REMEMBER THAT YOU ARE YOUR OWN MINER"
echo "HENCE YOU WILL NEED TO START ETHMINER WITH THE COMMAND IN ANOTHER TERMINAL"
echo "open a new terminal ctrl + alt + t, and type ethminer"

# parity --chain ./lib/genesis.json  --author ${address} --unlock ${address} --password ./lib/pswd --jsonrpc-interface all
# parity --identity leonode --datadir $root/$dataDir/$typeofchain $chainBlock  --author 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12
# parity $chainBlock --identity leonode --nodiscover --nat none --datadir $root/$dataDir/$typeofchain  $chainBlock --pruning fast --author 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12 -jw ui
parity --chain $root/parity-eth/lib/genesis.json --datadir $root/$dataDir/$typeofchain  --keys-path $root/$dataDir/$typeofchain/keys  --unlock 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12  --password ./lib/pswd  --identity sonia  --pruning fast --author 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12 ui
# parity --chain ~/parity-eth/lib/genesis.json --fork normal --datadir $root/$dataDir/$typeofchain --pruning fast -j ui
echo "parity --chain $root/parity-eth/lib/genesis.json --datadir $root/paridata/private -jw ui"

else

# parity --datadir=$root/$dataDir/$typeofchain  --chain=$chainBlock --unlock="" --pruning=fast --author= ui
parity --datadir $root/$dataDir/$typeofchain $chainBlock --keys-path $root/$dataDir/$typeofchain/keys --unlock 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12  --password ./lib/pswd  --pruning fast --author 8c8091a36a79f28f4fb8c85ae00d5a2ee1da0e12  ui

fi
