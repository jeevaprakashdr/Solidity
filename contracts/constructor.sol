// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Constructor {
    address public owner;
    uint public x;

    constructor(uint _x) {
        owner = msg.sender; // this is the address of account deplying this contract 
        x = _x;
    }
}