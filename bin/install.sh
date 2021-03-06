#!/bin/bash
# we add ethereum repository to the source.list
# update and upgrade your required packages
# this will check if rustc is install, which is requied in order to compile parity
# if rustc is not installed it will install it.
# parity stable release is installed.
# for ubuntu if you installed nodejs, that does not mean that node will point to nodejs so we check and make the required adjustments


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
#sudo apt-get install ethminer -y
#sudo apt-get install solc -y

pause 'This script will install most of the Ethereum parity packages, press [Enter] to continue...'

RUSTC_PATH=$(which rustc 2>/dev/null)
if [[ -f $RUSTC_PATH ]]; then
    echo " rustc is already installed... moving along"
else
   # bash <(curl https://sh.rustup.rs -sSf | sh)
   curl https://sh.rustup.rs -sSf | sh
   source $HOME/.cargo/env
fi

# this is for the binary install of parity don't need to do anything else one it is done.
bash <(curl https://get.parity.io -Lk) # this one install parity without the rust compiler for development release package
# the below will installs the developer addition. comment out if you want rust and other packages installed
# bash <(curl https://raw.githubusercontent.com/ethcore/parity/master/install-deps.sh -L) # this doesn't seem to work anymore

# cd /tmp/ && git clone https://github.com/ethcore/parity && cd parity
# bash <(cargo build --release)
#bash <(cargo install --git https://github.com/ethcore/parity.git parity)

pause 'We are going to take care of some quick house keeping, for ubuntu node, press [Enter] to move on...'

NODE_PATH=`which node 2>/dev/null`
NODEJS_PATH=`which nodejs 2>/dev/null`

if [[ -f $NODE_PATH ]]; then
    echo $NODE_PATH
elif [[ -f $NODEJS_PATH ]]; then
    sudo ln -s /usr/bin/nodejs /usr/bin/node
else
    echo 'It looks like we have issus with node js binary location, please go over the README about installing nodejs'
fi


pause 'hopefully no errors showed up in the install process, press [Enter] to finish install...'
echo "npm start private for a private blockchain"
echo "npm start testnet for a testnet blockchain"
echo "npm start livenet for a live net blockchain"
echo ""
parityVersion=( $(parity --version) )
currentParityVer=${parityVersion[2]}

parityPath=$(which parity 2>/dev/null)
if [[ -f $parityPath ]]; then
    echo "We are goood to goooooooo: $currentParityVer"
else
    echo "something really went wrong"
fi

#pause 'We need to reboot your system, Press [Enter] to reboot'
# sudo reboot
# uncomment this out if you are running the developer install.
# echo "Run the commands below"
# print "cd /tmp/parity/ and cp"