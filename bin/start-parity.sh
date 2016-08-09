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

# so we have installed parity and rust
# befor we go any deeper lets check if we have at least one account.

output=( $(parity account list) )
coinbase=${output[2]}

if [ ! -z "$coinbase" ]; then
    address=${output[2]}
    # exit
else
    $(parity account new --password ./lib/pswd)
    output=( $(parity account list) )
    address=${output[2]}
    echo "Since we couldn't find an address in parity for you, so we took the time to create one account. The password is located in the lib/pswd file"
    echo " "
    echo "here it is : " $address " you can also use parity account list, to show all your accounts"
    # exit
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
# address=0x$(parity account list | awk 'BEGIN{print}' | tr -cd '[[:alnum:]]._-')

echo "address: $address"
echo ""
echo "SINCE THIS IS A PRIVATE BLOCKCHAIN PLEASE REMEMBER THAT YOU ARE YOUR OWN MINER"
echo "HENCE YOU WILL NEED TO START ETHMINER WITH THE COMMAND IN ANOTHER TERMINAL"
echo "open a new terminal ctrl + alt + t, and type ethminer"

# parity --chain ./lib/genesis.json  --author ${address} --unlock ${address} --password ./lib/pswd --jsonrpc-interface all
# parity --identity leonode --datadir $root/$dataDir/$typeofchain $chainBlock  --author $address
# parity $chainBlock --identity leonode --nodiscover --nat none --datadir $root/$dataDir/$typeofchain  $chainBlock --pruning fast --author $address -jw ui
parity --chain $root/parity-eth/lib/genesis.json --datadir $root/$dataDir/$typeofchain  --keys-path $root/$dataDir/$typeofchain/keys  --unlock $address  --password ./lib/pswd  --identity sonia  --pruning fast --author $address ui
# parity --chain ~/parity-eth/lib/genesis.json --fork normal --datadir $root/$dataDir/$typeofchain --pruning fast -j ui
echo "parity --chain $root/parity-eth/lib/genesis.json --datadir $root/paridata/private -jw ui"

else

# parity --datadir=$root/$dataDir/$typeofchain  --chain=$chainBlock --unlock="" --pruning=fast --author= ui
parity --datadir $root/$dataDir/$typeofchain $chainBlock --keys-path $root/$dataDir/$typeofchain/keys --unlock $address --password ./lib/pswd --pruning fast --author $address ui

fi
