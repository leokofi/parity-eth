This is an implentation of the Ethereum parity client for development.
This setup has been tested on Ubuntu 14.04 and 16.04, and should work for most distros replace apt-get with the distros package manager command.

We try to take care off the required packages installed on your machine.

1. Install required packages first via the commands below.
    open terminal ctrl+alt+t copy and paste the following into the terminal window, or type it whatever works for you.

```
   * sudo apt-get update
   * sudo apt-get install nodejs -y
   * sudo apt-get install npm -y
```
    what should happen:
        This should set nodejs and npm support
        will update the packages and install

2. download or clone the git repo into your home directory .
    git clone https://github.com/leokofi/parity-eth.git && cd parity-eth
    what should happen:
        this will download the parity-eth repo from github; and create a folder called parity-eth
        once this is done, it will cd into the folder.

3. ls -a in the parity-eth
    What should happen:
      list all the files and directory that are in the folder even the hidden once

4. run the following commands in the terminal
    npm install
    What should happen:
      This will install all required npm packages in the folder that are list in the package.json file, and it also runs the install script in the bin directory.
      Install.sh script will install parity binary without developer options. If you want developer options edit the install.sh and comment out the default and uncomment the developer option.  
      It will install parity and create .parity directory in the $HOME directory

5. run decide what options you would like
    npm start [option]
    private blockchain => this is your local blockchain and you load the pre configure gensis block, you are doing the mining
    testnet blockchain => public blockchain for testing your apps, this can be reset anytime. fake eth
    live blockchain => this is the real deal... mistakes here will cost you eth

    what should happen:
      the npm start command with option will create a directory in $HOME
      => paridata/livenet; for the live blockchain network
      => paridata/testnet; for the test blockchain network
      => paridata/private; for your own private blockchain network

      keys are stored in the subdirectory of paridata/$typeofchain/keys
