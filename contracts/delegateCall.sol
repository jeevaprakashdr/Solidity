// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// delegate call is an alternative way to call function in another contract
// similar to call helper function
// It unlocks the possibility to interact from one smart contract with another by using the caller's context.
contract contractToBeCalled {
    uint public num;
    address public sender;
    uint public value;

    function setValues(uint _num) external payable{
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

// this cantract's storage, msg.sender and msg.value will be used 
contract delegatingContract {
    uint public num;
    address public sender;
    uint public value;

    function setValues(address _contractToBeCalled, uint _num) external payable{
        (bool _success, ) = _contractToBeCalled.delegatecall(abi.encodeWithSignature("setValues(uint256)", _num));

        require(_success, "delegation failed");
    }
}