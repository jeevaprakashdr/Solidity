// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HashFunc {
    function hash(string memory text, uint num, address addr) external pure  returns(bytes32){
        return keccak256(abi.encodePacked(text, num, addr));
    }

    // output 0x000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000003414141000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000034242420000000000000000000000000000000000000000000000000000000000
    function encode(string memory text0, string memory text1) external  pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    // compresed  output  0x414141424242
    function encodePacked(string memory text0, string memory text1) external  pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

/*    abi.encode          vs           abi.encodePacked

encodes data                        encodes data and compresses. also reduces some information from abi encode.



*/
}