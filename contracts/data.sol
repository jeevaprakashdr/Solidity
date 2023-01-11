// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Data types - values and references 

// following are value types

contract ValueTypes {
    bool public b = true;
    uint public u = 123; // uint ==> uint256 0 to 2**256 - 1; only positive numbers
    int public i = -123;  // uint ==> uint256 -2**255 to 2**256 - 1; positive and negative numbers

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db; 
    bytes32 public b32 = 0x68656c6c6f20746869732069732062333220737472696e672020617364616477;  // some random string value 
}