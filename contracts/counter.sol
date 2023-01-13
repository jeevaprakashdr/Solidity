// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    uint public count;

    function increament() external {
        count++;
    }

    function decreament() external {
        count--;
    }
}