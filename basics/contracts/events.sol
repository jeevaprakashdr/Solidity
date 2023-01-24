// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Events allow to write data on blockchain. 
// These data can not be retrieved later by smart contracts
contract Events {
    event Log(string message, uint val);
    // max 2 parameters can be set as indexed
    event indexedLog(address indexed sender, uint val);

    function example() external {
        emit Log("foo", 1234);
        emit indexedLog(msg.sender, 789);
    }

    event Message(address indexed _from, address indexed _to, string message);

    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    } 
}