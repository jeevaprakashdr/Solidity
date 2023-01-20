// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract multiCall {
    
    function number_one() external view returns (uint, uint){
        return (1, block.timestamp);
    }

    function number_two() external view returns (uint, uint){
        return (2, block.timestamp);
    }
}


contract contractToDoMultiCall {
    function multicall(address[] calldata targets, bytes[] calldata data) external view returns(bytes[] memory){
        require(targets.length == data.length, "");

        bytes[] memory results = new bytes[](data.length);
    }
}