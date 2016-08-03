#!bin/bash

# check to see if system has app need applications installed

#check if package is installed
#packageName1="ethminer"
#packageChecker=dpkg-query -l $packageName1

#if [ ! packageChecker ] then
#    sudo apt-get install $packageName1 -y
#    echo "ethminer has been installed and now moving on to the fun part"

#fi

function pause(){
    read -p "$*"
}

##Enable sources, add PPAs and update sources
sudo apt-get -y update
sudo apt-get install software-properties-common
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum-qt
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-dev
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install ethminer -y

pause 'This script will install most of the Ethereum parity packages, press [Enter] to continue...'

# this is for the binary install of parity don't need to do anythiny else one it is done.
bash <(curl https://get.parity.io -Lk) # this one install parity without the rust compiler for development
# this below installs the developer addition. comment out if you want rust and other packages installed
#bash <(curl https://raw.githubusercontent.com/ethcore/parity/master/install-deps.sh -L)


pause 'hopefully no errors showed up in the install process, press [Enter] to finish install...'
echo "npm start private for a private blockchain"
echo "npm start testnet for a testnet blockchain"
echo "npm start livenet for a live net blockchain"
# uncomment this out if you are running the developer install.
# echo "Run the commands below"
# print "cd /tmp/parity/ and cp"
