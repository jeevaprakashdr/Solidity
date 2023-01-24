// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint public totalWaves;

    function wave() public {
        totalWaves += 1;
    }
}