// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// call is a heloer function
// we have seen in the past, it is used to send ether to another contract. 
// here we are exploring how to invoke a function in another contract. 

contract TestCall {

    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(string calldata _message, uint _x) external payable returns (bool, uint){
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public data;

    function callFoo(address _test) external payable{
        (bool _success, bytes memory _data) = _test.call{value: 111}(
            abi.encodeWithSignature(
                "foo(string,uint256)", "mesage", 123
            )
        );

        require(_success, "call failed");
        data = _data;
    }

    function callFunctionDoesNotExists(address _test) external payable{
        (bool _success, ) = _test.call{value: 111}(abi.encodeWithSignature("XBC"));
        require(_success, "call failed");
    }
}