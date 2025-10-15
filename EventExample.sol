// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件，用于记录数值更新
    event ValueUpdated(address indexed sender, uint256 oldValue, uint256 newValue, string message);

    // 存储一个简单的数值
    uint256 public storedValue;

    constructor(uint256 initialValue) {
        storedValue = initialValue;
    }

    // 更新数值的函数，会触发事件
    function updateValue(uint256 newValue, string memory message) public {
        uint256 oldValue = storedValue;
        storedValue = newValue;
        
        // 触发事件，将数据保存到区块链上
        emit ValueUpdated(msg.sender, oldValue, newValue, message);
    }
    
    // 获取当前存储的值
    function getValue() public view returns (uint256) {
        return storedValue;
    }
}