// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Immutable {

    // immutable state variables are like constants cannot be modified  
    // constant variables, the value has to be fixed at compile-time 
    // immutable, value can be assigned at construction time

    // by declaring immutable some gass is saved.
    address public immutable owner;
    address public immutable owner_new = msg.sender;
    
    constructor() {
        owner = msg.sender;
    }
}