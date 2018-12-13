var Migrations = artifacts.require("./Migrations.sol");
var Inheritance = artifacts.require("./Inheritance.sol");

module.exports = function(deployer, network, accounts) {
  const giver = accounts[0]
  const receiver= accounts[1]
  const numOfVotes = 3;
  const trustGroup = [accounts[3],accounts[4],accounts[5],accounts[6],accounts[7]];
 
  deployer.deploy(Migrations);
  deployer.deploy(Inheritance, giver, receiver, numOfVotes, trustGroup, {value: 1000});
};
