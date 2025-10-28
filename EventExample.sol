// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(address indexed changer, uint256 oldValue, uint256 newValue);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    
    uint256 public value;
    
    constructor(uint256 initialValue) {
        value = initialValue;
        emit LogMessage("Contract deployed", block.timestamp);
    }
    
    // 修改值的函数，会触发ValueChanged事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        
        // 触发ValueChanged事件
        emit ValueChanged(msg.sender, oldValue, newValue);
    }
    
    // 转账函数，会触发Transfer事件
    function transfer(address to, uint256 amount) public {
        require(to != address(0), "Invalid address");
        
        // 触发Transfer事件
        emit Transfer(msg.sender, to, amount);
    }
    
    // 记录消息的函数，会触发LogMessage事件
    function logMessage(string memory message) public {
        emit LogMessage(message, block.timestamp);
    }
    
    // 获取当前值
    function getValue() public view returns (uint256) {
        return value;
    }
}