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
> Install.sh script will install parity binary without developer options. If you want developer options edit the install.sh and comment out the default and uncomment the developer option.  
> It will install parity and create .parity directory in the $HOME directory

5. Decide what options you would like and run the command listed

```bash
npm start [option]
```
> private blockchain => this is your local blockchain and you load the pre configure gensis block, you are doing the mining
> testnet blockchain => public blockchain for testing your apps, this can be reset anytime fake eth
> live blockchain => this is the real deal... mistakes here will cost you eth

what should happen:
> The npm start command with option will create a directory in $HOME if this is the first time.
> it will lunch a browser that will point to http://localhost:3030 for the UI to parity stats and wallet info.
    => paridata/livenet; for the live blockchain network
    => paridata/testnet; for the test blockchain network
    => paridata/private; for your own private blockchain network

For private blockchain the gensis.json file is loaded, hence you need to run ethminer in another terminal to start mining your blocks.

Todo : for private blockchain being able to configure and setup other nodes to create a full private blockchain.

to interact with ethereum via com line... you can use node, open a new terminal and type:

```bash
node util
```

What should happen:
it will give you > that you can use to interact with ethereum. below are some commands you can tryout.

```bash
npm run util
```

keys are stored in the subdirectory of paridata/$typeofchain/keys