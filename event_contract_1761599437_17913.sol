// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name);
    event Transfer(address indexed from, address indexed to, uint256 value);

    uint256 public value;
    mapping(address => uint256) public balances;

    constructor(uint256 _initialValue) {
        value = _initialValue;
        // 在构造函数中触发事件
        emit ValueChanged(msg.sender, 0, _initialValue);
    }

    // 修改值的函数，会触发事件
    function setValue(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;
        emit ValueChanged(msg.sender, oldValue, _newValue);
    }

    // 注册用户的函数，会触发事件
    function registerUser(string memory _name) public {
        emit UserRegistered(msg.sender, _name);
    }

    // 转账函数，会触发事件
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
    }

    // 为账户充值的辅助函数
    function deposit(uint256 _amount) public {
        balances[msg.sender] += _amount;
    }
}