// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// anyone will be able to send ether to this contract 
// only owner can send ether out of this contract
contract EtherWallet {
    
    address payable immutable public owner;
    
    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
    }

    function withdraw(uint _amount) external {
        require(owner == msg.sender, "not owner");
        
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint){
        return address(this).balance;    
    }
}