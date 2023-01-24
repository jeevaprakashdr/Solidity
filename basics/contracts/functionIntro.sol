// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// simple function
// external keyword means the function can be invoked from outside the contract
// pure keyword means the function can only read only. the function will not write anything to block chain. 

contract FunctionIntro {
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns (uint) {
        return x -y;
    }   
}