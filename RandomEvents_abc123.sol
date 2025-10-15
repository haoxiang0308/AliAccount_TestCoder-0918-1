// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义一个事件，用于记录数值变化
    event ValueChanged(address indexed changer, uint256 oldValue, uint256 newValue);
    
    // 定义另一个事件，用于记录账户余额变化
    event BalanceUpdated(address indexed account, uint256 balance);
    
    uint256 public value;
    mapping(address => uint256) public balances;
    
    constructor(uint256 initialValue) {
        value = initialValue;
        emit ValueChanged(msg.sender, 0, initialValue);
    }
    
    // 修改值的函数，会触发ValueChanged事件
    function setValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        emit ValueChanged(msg.sender, oldValue, newValue);
    }
    
    // 更新余额的函数，会触发BalanceUpdated事件
    function updateBalance(address account, uint256 amount) public {
        balances[account] = amount;
        emit BalanceUpdated(account, amount);
    }
    
    // 提款函数，也会触发事件
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        emit BalanceUpdated(msg.sender, balances[msg.sender]);
    }
}