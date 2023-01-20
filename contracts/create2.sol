// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ContractToDeploy {

    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }   
}

contract Factory {
    event Deploy(address addr);

    function deploy(uint _salt) external 
    {
        ContractToDeploy _contract = new ContractToDeploy{salt: bytes32(_salt)}(msg.sender);
        emit  Deploy(address(_contract));
    }

    function getAddress(bytes memory byteCode, uint _salt) public view returns (address)
    {
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xff), address(this), _salt, keccak256(byteCode)));
        return address(uint160(uint(hash)));
    }

    function getByteCode(address _owner) public pure returns (bytes memory) 
    {
        bytes memory bytecode = type(ContractToDeploy).creationCode;
        return abi.encodePacked(bytecode, abi.encode(_owner));
    }
}