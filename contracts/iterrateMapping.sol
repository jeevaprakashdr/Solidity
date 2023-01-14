// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// mapping does not provide size of it.
// mapping does not suppot looping to iterate items with it 
contract IteratingMapping { 
    mapping(address => uint) public balance;
    mapping(address => bool) public inserted;
    address[] public keys;

    function setBalance(address _key, uint _val) external {
        balance[_key] = _val;
        if(!inserted[_key]) {
            inserted[_key] = true;
            keys.push(_key);
        }
    }

    function getSize() external view returns (uint) {
        return keys.length;
    } 

    function first() external view returns (uint) {
        return balance[keys[0]];
    }

    function last() external view returns (uint) {
        return balance[keys[keys.length - 1]];
    }

    function get(uint _index) external view returns (uint) {
        return balance[keys[_index]];
    }
}