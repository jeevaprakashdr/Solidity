// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// three ways to throw an error 
// require, revert and assert 
// on any of the above happens 
// the gas fee is funded and state updates are reverted

// 4th way "custom errors", saves the gas while throwin the errors 
contract Errors {
    
    // "require" is a preconditional check for any function.
    function requireExample(uint _x) public pure {
        require(_x < 10, "value should be less than 10");

        // more code
    }

    // "rever" is same as "require" if it is used as precondtion.
    // but it is mostly used as a way to throw error inside a functions
    function revertExample(uint _x) public pure {
        if(_x < 10) {
            revert("value should be less than 10");
        }

        // more code 
        _x += 10;

        if(_x == 20)
        {
            revert("value should be less than 20");
        }
    }

    uint public num = 123;

    // "assert" is mostly used on conditions which always needs to be true
    function assertExample() public {
        foo();

        assert(num == 123);
    }

    function foo() public  {
        num += 1; // accidental update on state variable
    }

    
    error LessThan10Error();
    error MoreThan20Error(address caller, uint value); // custome error logging soem data
    function customErrorExample(uint _x) public view {
        if(_x < 10) {
            revert LessThan10Error();
        }

        if(_x > 20) {
            revert MoreThan20Error({caller: msg.sender, value: _x});
        }
    }
}
