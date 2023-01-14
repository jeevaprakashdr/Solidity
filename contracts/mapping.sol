// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// mapping is liek a dictionary in solidity 
// it  provides fast look up;
contract Mapping {
    mapping(address => uint) public  balances;
    mapping(address => mapping(address => bool)) public isFriend;

    function example() external {
        balances[msg.sender] = 123;
        uint bal = balances[msg.sender];
        uint balOfAddress1 = balances[address(1)]; // default value 0 is assigned;
        balances[msg.sender] += 456; // 579
        delete balances[msg.sender]; // value for msg.sender in balance is reset to 0


        isFriend[msg.sender][address(this)] = true;
    }
}