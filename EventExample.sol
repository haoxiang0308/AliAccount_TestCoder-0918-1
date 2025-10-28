// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(
        address indexed sender,
        uint256 oldValue,
        uint256 newValue,
        string message
    );
    
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 value
    );
    
    uint256 public value;
    string public message;
    
    constructor(uint256 initialValue, string memory initialMessage) {
        value = initialValue;
        message = initialMessage;
        // 在构造函数中触发事件
        emit ValueChanged(msg.sender, 0, initialValue, initialMessage);
    }
    
    // 修改值的函数，会触发事件
    function setValue(uint256 newValue, string memory newMessage) public {
        uint256 oldValue = value;
        value = newValue;
        message = newMessage;
        
        // 触发ValueChanged事件
        emit ValueChanged(msg.sender, oldValue, newValue, newMessage);
    }
    
    // 转账函数，触发Transfer事件
    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        // 触发Transfer事件
        emit Transfer(msg.sender, to, amount);
    }
    
    // 一个更复杂的事件示例
    event ComplexEvent(
        address indexed user,
        uint256[] values,
        string details,
        bool flag
    );
    
    function complexFunction(uint256[] memory inputValues, string memory details, bool flag) public {
        // 触发复杂事件
        emit ComplexEvent(msg.sender, inputValues, details, flag);
    }
}