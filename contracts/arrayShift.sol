// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ArrayShift {
    uint[] public arr;

    function example() public {
        arr = [1, 2, 3];
        delete arr[1]; // [1, 0, 3]
    }

    // shifting element to left 
    // [1, 2, 3] --> remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] --> remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // This is one of the approach to remove element and not having default value
    // But this is not gas efficient
    function removeByShiftLeft(uint _index) public {
    }

    // Replacing an element is a gas efficient way of removing element in an array
    // But order of the array element will not be maintained
    function removeByReplaceElement(uint _index) public {
        arr[_index] = arr[arr.length - 1];
        arr.pop();
    }
}