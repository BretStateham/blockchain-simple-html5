# blockchain-simple-html5
Simple blockchain sample using truffle, a single contract, and HTML5/JS/CSS (no UI frameworks)

Steps

1. Cloned the repo:

  ```bash
  git clone https://github.com/BretStateham/blockchain-simple-html5
  ```

1. Changed into the directory:

  ```bash
  cd ./blockchain-simple-html5
  ```

1. Ran:

  ```bash
  truffle init
  ```

1. Created `contracts/HelloWorld.sol` with the following code:

  ```text
  pragma solidity ^0.4.17;

  contract HelloWorld {

    bytes32 name;

    function HelloWorld() public {
      name = 0x0;
    }

    function setName(bytes32 _name) public returns (bytes32 _newName) {
      name = _name;
      return name;
    }

    function getName() constant public returns (bytes32 _name) {
      return name;
    }

  }
  ```

1. Added `migrations/2_deploy_contracts.js` with the following code:

  ```js
  ```

1. Started ganache and ensured it was listening on port 7547

1. Deleted the boilerplate `truffle.js` that was created by `truffle init` previously

  ```bash
  rm tuffle.js
  ```

1. Replaced the contents of `truffle-config.js` with the folow code:

  ```js
  module.exports = {
    // See <http://truffleframework.com/docs/advanced/configuration>
    // to customize your Truffle configuration!
    networks: {
      ganache: {
        host: "localhost",
        port: 7545,
        network_id: "*" // match any network
      }
    }
  };
  ```

1. Ran

  ```bash
  truffle console --network ganache
  ```

1. In the truffle console, I first confirmed that I could return the initially empty (0x0000.....) name value from the contract by running the following statement at the `truffle(ganache)` prompt:

  ```js
  HelloWorld.deployed().then(function(instance){return instance.getName.call();}).then(function(value){ return value});
  ```

1. Next, I assigned a new value ("Bret" = "0x4272657400000...") using this statement:

  ```js
  HelloWorld.deployed().then(function(instance){return instance.setName("Bret");});
  ```

1. Then retrieved it once again to verify that I got the new name value (0x427265740000...):

  ```js
  HelloWorld.deployed().then(function(instance){return instance.getName.call();}).then(function(value){ return value});
  ```