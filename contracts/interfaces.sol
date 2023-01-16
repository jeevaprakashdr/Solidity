// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface ICounter {
    function count() external view returns (uint);

    function increament() external;
}

contract CallInterface {

    uint public count;

    function example(address _counter) external {
        ICounter(_counter).increament();
        count = ICounter(_counter).count();
    }
}