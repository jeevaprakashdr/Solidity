// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// State variables are the variables which is saved in the block chain.
// Local variables are the variables scoped within a function.
// Global 
contract StateVariables {
    uint public stateVariable; // simple example of state variable    
    uint public anotherstateVariable = 123; // simple example of state variable    

    function foo() external {
        uint notStateVariable = 567; // these are local variables
    }
}