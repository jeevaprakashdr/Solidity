// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// documentation on https://eips.ethereum.org/EIPS/eip-20
interface IERC20 {

    // Returns the total token supply.
    function totalSupply() external view returns(uint);

    // Returns the account balance of another account
    function balanceOf(address account) external view returns (uint);

    // Transfers _value amount of tokens to address recipient, and MUST fire the Transfer event. 
    function transfer(address recipient, uint amount) external returns (bool);

    // Returns the amount which spender is still allowed to withdraw from owner
    function allowance(address owner, address spender) external view returns (uint);

    // Allows spender to withdraw from your account multiple times, up to the amount. 
    function approve(address spender, uint amount) external returns (bool);

    // Transfers amount of tokens from sender address to recipient address
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);
}


contract ERC20 is IERC20 {
    
    uint public totalSupply;
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    string public name = "Test";
    string public symbol = "TEST";
    uint8 public decimals = 18;

    // Transfers _value amount of tokens to address recipient, and MUST fire the Transfer event. 
    function transfer(address recipient, uint amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    // Allows spender to withdraw from your account multiple times, up to the amount. 
    function approve(address spender, uint amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Transfer(msg.sender, spender, amount);

        return true;
    }

    // Transfers amount of tokens from sender address to recipient address
    function transferFrom(address sender, address recipient, uint amount) external returns (bool) {
         allowance[sender][msg.sender] -= amount;
         balanceOf[sender] -= amount;
         balanceOf[recipient] += amount;

         emit Transfer(sender, recipient, amount);
         return true;
    }

    // create new token
    function mint(uint amount)  external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;

        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Transfer(msg.sender, address(0), amount);
    }
}