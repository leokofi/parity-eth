This is an implentation of the Ethereum parity client for development.
This setup has been tested on Ubuntu 14.04 and 16.04, and should work for most distros replace apt-get with the distros package manager command.

We try to take care off the required packages installed on your machine.

1. Install required packages first via the commands below.
> Open terminal ctrl+alt+t copy and paste the following into the terminal window, or type it whatever works for you.

```bash
sudo apt-get update
sudo apt-get install nodejs -y
sudo apt-get install npm -y
```
What should happen:
> This should set nodejs and npm support
> will update the packages and install

2. Download or clone the git repo into your home directory.

```bash
git clone https://github.com/leokofi/parity-eth.git && cd parity-eth
```
what should happen:
> This will download the parity-eth repo from github; and create a folder called parity-eth
> once this is done, it will cd into the folder.

3. ls -a in the parity-eth

What should happen:
> list all the files and directory that are in the folder even the hidden once

4. run the following commands in the terminal

```bash
npm install
```

What should happen:

> This will install all required npm packages in the folder that are list in the package.json file, and it also runs the install script in the bin directory.
> Install.sh ** This will take about 10 min** script will compile and install parity. This will install the development version and not the current stable version and uncomment the developer option.  
> It will install parity and create .parity directory in the $HOME directory
> it will also create a node_modules folder which keeps all nodejs stuff.

5. Decide what options you would like and run the command listed

```bash
npm start [option]
```
> checks if you have at least one address setup, if not it will create one for you.
> private blockchain => this is your local blockchain and you load the pre configure gensis block, you are doing the mining
> testnet blockchain => public blockchain for testing your apps, this can be reset anytime fake eth
> live blockchain => this is the real deal... mistakes here will cost you eth

what should happen:
> The npm start command with option will create a directory in $HOME if this is the first time.
> it will lunch a browser that will point to http://127.0.0.1:8080/ for the UI to parity stats and wallet info.
* paridata/livenet; for the live blockchain network
* paridata/testnet; for the test blockchain network
* paridata/private; for your own private blockchain network

For private blockchain the gensis.json file is loaded, hence you need to run ethminer in another terminal to start mining your blocks.

Todo : for private blockchain being able to configure and setup other nodes to create a full private blockchain.

to interact with ethereum via command line... you can use node, open a new terminal and type:

```bash
npm run util
```

What should happen:
it will give you ">" that you can use to interact with ethereum. below are some commands you can tryout.

```bash
web3.eth.getBalance(web3.eth.accounts[0]) //this will get the account balance of the coinbase account in wei
web3.fromWei(web3.eth.getBalance(web3.eth.accounts[0])) // this will give you the account balance in eth

```
```text
\bin => hold the bash files i.e install.sh, start-parity.sh stop.sh and clean.sh
\lib => holds gensis or any other liberary that we might need; the default pswd file is stored here.. you can use this for quick unlocking of accounts. use only in testnet and private chain
\node_modules => which is created when you first run the npm install command, this keeps all the node packages required
package.json file => is details all that node/npm are doing.
util.js is the file that connects you to ethereum via node console, i will include some function later.

```
Each chain has it's own directory where info is stored ($HOME/paridata/$typeofchain)
Keys are stored in the subdirectory of paridata/$typeofchain/keys