// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Constants {

    // state variables can be constants when the value doesnot change in the contract.
    // by defining it as constants, the function uses the constants will save the gas while exection 

    // execution cost of 21442 gas
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000000001;
}


contract NonConstant {
    // execution cost of 23553 gas
    address public myAddress = 0x0000000000000000000000000000000000000001;
}