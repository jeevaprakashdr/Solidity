// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//              |  read    write   modify/update
//        View  |   T        F          F
//        Pure  |   F        F          F

contract viewAndPureFunctions {
    uint public num;

    // view function does not modify state variables or write anything to the blockchain.
    function viewFunc() external view returns(uint) {
        return num;
    }

    // readonly function does not modify or read data from blockchain.
    function pureFunc() external pure returns(uint) {
        return 1;
    }

    // view func example 
    function addToNum(uint x) external view returns (uint) {
        return num + x; // num is a state variable and its value is saved in blockchain.
    }

    // pure func example
    function add(uint x, uint y) external pure returns (uint) {
        return x + y; // x and y variables are local to function. 
                      // the code within the function does not read data or modify the data in blockchain
    }
}