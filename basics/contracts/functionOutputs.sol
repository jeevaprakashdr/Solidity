// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FunctionOutputs {
    function returnManyExample() public pure returns (uint, bool) {
        return (1, true);
    }

    function returnNamedManyExample() public pure returns (uint x, bool b) {
        return (1, true);
    }

    function namedoutputExample() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignmentExample() public pure {
        (uint x, bool b) = returnManyExample();
        (, bool _b) = returnManyExample();
    }
}