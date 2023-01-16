// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Payable keyward adds functionality to send and recieve ether
contract Payable {

    // payable address can send ether
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getBalance() external  view returns (uint) {
        return address(this).balance;
    }
    
    function deposit() external payable {
    }
}