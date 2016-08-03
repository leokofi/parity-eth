// this has been build on many code examples and resources from friends and enemies.
const repl = require('repl');
var Web3 = require("web3");
var fs = require('fs');
//var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));

if (typeof web3 == "undefined"){
    web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
    web3.eth.defaultAccount = web3.eth.coinbase; 
}

//"install: ./bin/install.sh",
function loadEmpty () {
  console.log("HI Leonard");
}

module.exports.loadEmpty = loadEmpty;
module.exports.web3 = web3;


if (process.argv[2])
{
	if (process.argv[2] == "console") {
    session = repl.start('> ');
    session.context.util = this;
	}
}
