// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// Any one can deposit eth into his contract
// only owner can withdraw 
// destry the contract while withdoraw

contract PiggyBankAPP {

    event log(address sender, uint value, string message);

    address immutable public owner;

    constructor() {
        owner = payable(msg.sender);
    }    

    receive() external payable {        
        emit log(msg.sender, msg.value, "deposited into piggy bank");
    }

    modifier onlyTheOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function withdrow() external onlyTheOwner payable{        
        emit log(msg.sender, address(this).balance, "withdoraw from and destrying piggy bank");
        selfdestruct(payable(msg.sender));
    }
}