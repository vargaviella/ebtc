pragma solidity ^0.5.11;

import "../node_modules/@openzeppelin/contracts/ownership/Ownable.sol";

contract NameRegistry is Ownable {

    mapping (string => address) public registry;

    function registerContract(string memory name, address addr) public onlyOwner returns(bool) {
        require(registry[name] == address(0), "NameReg: name already maps to an addr");
        registry[name] = addr;
        return true;
    }

    function updateAddress(string memory name, address addr) public onlyOwner returns(bool) {
        require(registry[name] != address(0), "NameReg: name does not map to an addr");
        registry[name] = addr;
        return true;
    }

    function getAddress(string memory name) public view onlyOwner returns(address) {
        require(registry[name] != address(0), "NameReg: name does not map to an addr");
        return registry[name];
    }
}