// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    event UserAction(address indexed user, string action, uint256 amount);

    // 存储变量
    mapping(address => uint256) public balances;

    constructor() {
        balances[msg.sender] = 1000;
    }

    // 触发Transfer事件的函数
    function sendTokens(address _to, uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _amount);
    }

    // 触发LogMessage事件的函数
    function logSomething(string memory _message) public {
        emit LogMessage(_message, block.timestamp);
    }

    // 触发UserAction事件的函数
    function performAction(string memory _action, uint256 _amount) public {
        // 触发UserAction事件
        emit UserAction(msg.sender, _action, _amount);
    }

    // 一个综合示例，同时触发多个事件
    function complexOperation(address _recipient, uint256 _value, string memory _description) public {
        require(balances[msg.sender] >= _value, "Not enough balance");
        
        balances[msg.sender] -= _value;
        balances[_recipient] += _value;
        
        // 触发多个事件
        emit Transfer(msg.sender, _recipient, _value);
        emit LogMessage(_description, block.timestamp);
        emit UserAction(msg.sender, "complex_operation", _value);
    }
}