// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractWithEvents {
    // 定义多个事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event ValueUpdated(uint256 oldValue, uint256 newValue, address updater);
    event LogMessage(string message, address sender);

    uint256 public value;
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    constructor(uint256 initialValue) {
        value = initialValue;
        balances[msg.sender] = initialValue;
        emit ValueUpdated(0, initialValue, msg.sender);
        emit LogMessage("Contract deployed", msg.sender);
    }

    // 触发ValueUpdated事件
    function updateValue(uint256 newValue) public {
        uint256 oldValue = value;
        value = newValue;
        emit ValueUpdated(oldValue, newValue, msg.sender);
    }

    // 触发Transfer事件
    function transfer(address to, uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    // 触发Approval事件
    function approve(address spender, uint256 amount) public {
        allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }

    // 触发LogMessage事件
    function logMessage(string memory message) public {
        emit LogMessage(message, msg.sender);
    }

    // 辅助函数：获取指定地址的余额
    function getBalance(address account) public view returns (uint256) {
        return balances[account];
    }
}