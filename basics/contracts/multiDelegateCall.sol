// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract MultiDelegateCall {

    error DelegatecallFailed();

    function multiDelegaetCall(bytes[] calldata data) external payable returns(bytes[] memory results){
        results = new bytes[](data.length);

        for (uint i; i < data.length; i++) 
        {
            (bool ok, bytes memory res) = address(this).delegatecall(data[i]);
            if(!ok){
                revert DelegatecallFailed();
            }
           results[i] = res;
        }
    }
}

// In a melticall if we want to preserve the actuall caller details 
// we use the multi caller delegate 
contract TestMultiDelegateCall is MultiDelegateCall{
    event log(address caller, string func, uint i);

    function func1(uint x, uint y) external {
        emit log(msg.sender, "func1", x + y);
    }

    function func2() external returns (uint) {
        emit log(msg.sender, "func2", 2);
        return 222;
    }
}

contract Helper {

    function  getFunc1Data(uint x, uint y)external pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegateCall.func1.selector, x , y);
    }

    function  getFunc2Data()external pure returns (bytes memory) {
        return abi.encodeWithSelector(TestMultiDelegateCall.func2.selector);
    }
    
}