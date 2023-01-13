// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Function modifiers allow reuse code.
contract FunctionModifiers {
    bool public paused;
    uint public count;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    function incCount_v1() external {
        require(!paused, "paused"); // duplication of code
        count += 1;
    }

    function decCount_v1() external {
        require(!paused, "paused"); // duplication of code
        count -= 1;
    }

    modifier whenNotPaused() {
        require(!paused, "paused");
        _; // underscore tells the solidity to go back to function wrapping this modifier
    }

    function incCount_v2() external whenNotPaused {
        count += 1;
    }

    function decCount_v2() external whenNotPaused {
        count -= 1;
    }

    // input modifier 
    // like a normal function these takes inputs
    modifier cap(uint _x) {
        require(_x < 100, "x > 100");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x){
        count += _x;
    }

    modifier  sandwichExample() {
        // code here

        count +=10; // increament count
        _;          // go back to function wrapping the modifier and finish exection

        // more code 
        count += 2; // return to modifier after the function execution finished.
    }

    function sandwichFunction() external sandwichExample {
        count += 1; 
    }
}