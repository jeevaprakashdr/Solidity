// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract S  {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

contract T  {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// initialise parent constrctor
// order of CONSTRUUCTOR initialisation is based on ORDER OF inheritance 
contract U is S("s"), T("T")  {
}

contract V is S, T {
    constructor(string memory _name, string memory _text) S(_name) T(_text) {
    }
}

contract W is S("s"), T {
    constructor(string memory _text) T(_text) {
    }
}