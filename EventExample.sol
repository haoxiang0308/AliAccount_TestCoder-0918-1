// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件，用于记录值的更改
    event ValueChanged(address indexed changer, uint256 oldValue, uint256 newValue);

    uint256 private value;

    constructor(uint256 initialValue) {
        value = initialValue;
    }

    // 修改值的函数，并触发事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        
        // 触发事件，记录更改者地址、旧值和新值
        emit ValueChanged(msg.sender, oldValue, newValue);
    }

    // 获取当前值
    function getValue() public view returns (uint256) {
        return value;
    }
}