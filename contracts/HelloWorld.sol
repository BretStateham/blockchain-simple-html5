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