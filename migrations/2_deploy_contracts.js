var HelloWorld = artifacts.require("HelloWorld");

module.exports = function (deployer, networks, accounts) {
  deployer.deploy(HelloWorld);
}

