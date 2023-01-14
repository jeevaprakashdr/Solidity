// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract SimpleStorageApp {
    string public text;

    // setText parameter could be 
    // memory : this consumes 51948 gas to execute 
    // calldata: this consumes 28550 gas to execute  
    // call data is most prefered type set to function parameter as it takes less gas 
    function setText(string memory _text) external {
        text = _text;
    }

    function gettext() external view returns (string memory) {
        return text;
    }
}