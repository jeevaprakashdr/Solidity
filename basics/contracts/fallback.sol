// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Fallback is a helper function get invoked 
// when a called function doesnot exists within a contract 

/*
    when fallback() or recieve() helper functions get invoked

    Ether is  sent to contract 
              |
        is msg.data empty
            /      \ 
        Yes         No
         /           \
recieve() exists?     fallback()
       /   \
    Yes     No
    /         \
recieve()    fallback()

*/
contract Fallback {
    
    event log(string func, address sender, uint value, bytes data);

    // 
    fallback() external payable { 
        emit log("fallback", msg.sender, msg.value, msg.data);
    }

    // recieve direct sending of ether
    receive() external payable {
        emit log("recieve", msg.sender, msg.value, "");
    }
}