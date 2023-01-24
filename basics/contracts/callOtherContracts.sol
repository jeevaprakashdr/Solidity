// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract CallTestContract {

    function setX(address _testContract, uint _x) external {
        TestContract(_testContract).setX(_x);
    }

    function setX1(TestContract _testContract, uint _x) external {
        _testContract.setX(_x);
    }

    function getX(TestContract _testContract) external view  returns (uint){
        return _testContract.getX();
    }

    function setXAndSendEther(TestContract _testContract, uint _x) external payable {
        _testContract.setXAndRecieveEther{value: msg.value}(_x);
    }

    function getXAndGetEther(TestContract _testContract) external payable returns(uint x , uint value){
        (x, value) = _testContract.getXAndEther();
    }
}

contract  TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns(uint) {
        return x;
    }

    function setXAndRecieveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

     function getXAndEther() external payable returns(uint, uint) {
        return (x, value);
    }
}