// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract SelfDestruct {
    
    constructor() payable {       
    }

    function Kill() external{
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint) {
        return 123;
    }
}