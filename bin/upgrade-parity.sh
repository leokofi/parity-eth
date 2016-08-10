#!/bin/bash
# this will upgrade parity create


function pause(){
    read -p "$*"
}

parityVersion=( $(parity --version) )
currentParityVer=${parityVersion[2]}

pause "The upgrade will only be done for npm packages and parity, your current parity version is $currentParityVer, press [Enter] to continue..."
echo ""
echo $currentParityVer

# now we run the script to install parity, as it doesn't have an upgrade command yet'
# default easy install command, but it is behind
#bash <(curl https://get.parity.io -Lk) # this one install parity without the rust compiler for development

# the command below get you the latest working copy but you have to do extra working.
# once this is build you will have to copy files to /usr/local/bin
# nevermind it is taken care of....
# bash <(curl https://raw.githubusercontent.com/ethcore/parity/master/install-deps.sh -L)

# cd /tmp/parity/ && cp target/

parityUpgradeVersion=( $(parity --version) )
upgradedParityVer=${parityUpgradeVersion[2]}

if [ $currentParityVer = $upgradedParityVer ]; then
echo "it looks like the current parity is the same as the upgrade"
else
echo "Your new parity version is $upgradedParityVer"
fi