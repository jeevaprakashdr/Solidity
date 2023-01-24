// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Arrays {
    uint[] public dynamicNums = [1, 2, 3]; // dynamic arrays
    uint[4] public fixedNums = [4, 5, 6, 7];

    function arrayOperations() external {
        dynamicNums.push(4); // [1, 2, 3, 4]
        uint x = dynamicNums[1]; // 1
        dynamicNums[2] = 22; // [1, 22, 3, 4]
        delete dynamicNums[1]; // [1, 0 , 3, 4] default value of uint is assigened 

        dynamicNums.pop(); // [1, 22, 3] removed the last element and shrinks the size

        // array in memory
        // it has to be fixed size
        // memory array does not support push() and pop()
        uint[] memory memoryArrayExample = new uint[](3);
        memoryArrayExample[1] = 123; // updating in memory array 
    }

    // returning array from functions are not recommended
    // bigger the array it needs more the gas to execute the function
    // it could lead to drain all the gas and this function is unuable
    function returnArrayExample() external view returns (uint[] memory) {
        return dynamicNums;
    }
}