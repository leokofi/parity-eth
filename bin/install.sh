#!/bin/bash
# this will upgrade parity create


function pause(){
    read -p "$*"
}

pause 'First we will update your package and the add the ethereum repo to your source.list, press [Enter] to continue...'

## Enable sources, add PPAs and update sources
sudo apt-get -y update
sudo apt-get install software-properties-common
#sudo add-apt-repository -y ppa:ethereum/ethereum-qt
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install solc ethminer -y

pause 'This script will install most of the Ethereum parity packages, press [Enter] to continue...'

RUSTC_PATH=$(which rustc 2>/dev/null)
if [[ -f $RUSTC_PATH ]]; then
    echo " rustc is already installed... moving along"
else
    bash <(curl https://sh.rustup.rs -sSf | sh)
fi

# this is for the binary install of parity don't need to do anythiny else one it is done.
# bash <(curl https://get.parity.io -Lk) # this one install parity without the rust compiler for development
# the below will installs the developer addition. comment out if you want rust and other packages installed
# bash <(curl https://raw.githubusercontent.com/ethcore/parity/master/install-deps.sh -L)

# cd /tmp/ && git clone https://github.com/ethcore/parity && cd parity
# bash <(cargo build --release)
bash <(cargo install --git https://github.com/ethcore/parity.git parity)


pause 'hopefully no errors showed up in the install process, press [Enter] to finish install...'
echo "npm start private for a private blockchain"
echo "npm start testnet for a testnet blockchain"
echo "npm start livenet for a live net blockchain"
# uncomment this out if you are running the developer install.
# echo "Run the commands below"
# print "cd /tmp/parity/ and cp"