// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x > y ? x : y;
    }
}

contract TestContract {
    function max(uint x, uint y) external  pure returns (uint) {
        return Math.max(x, y);
    }   
}

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) 
        {
            if(arr[i] == x){
                return i;
            }
        }

        revert("not found");
    }
}
contract TestArray {
    using ArrayLib for uint[]; // Associating the library directly on type. This is similar to extension methods in C#
    uint[] public arr = [3, 2, 1];

    function testFind() external view returns (uint index) {
        //return  ArrayLib.find(arr, 2); 
        return  arr.find(2); // 
    }
}