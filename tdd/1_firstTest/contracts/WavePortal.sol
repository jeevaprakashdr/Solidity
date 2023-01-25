// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    struct Wave {
        string message;
        address owner;
    }

    uint public totalWaves;
    Wave[] private waves;
    
    function wave(string memory _message) public {
        totalWaves += 1;
        waves.push(Wave(_message, msg.sender));
    }

    function allWaves() view public returns(Wave[] memory) {
        return waves;
    }
}