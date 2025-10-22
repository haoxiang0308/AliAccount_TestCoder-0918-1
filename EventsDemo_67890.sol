// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventsDemo {
    // 定义不同类型的事件
    event ValueChanged(address indexed author, uint oldValue, uint newValue);
    event UserRegistered(address indexed user, string name, uint256 registrationTime);
    event TransactionExecuted(address indexed from, address indexed to, uint256 amount, bool success);
    
    // 合约状态变量
    uint256 public currentValue;
    mapping(address => string) public userNames;
    mapping(address => bool) public registeredUsers;
    
    constructor() {
        currentValue = 0;
    }
    
    // 修改值并触发ValueChanged事件
    function updateValue(uint256 _newValue) public {
        uint256 oldVal = currentValue;
        currentValue = _newValue;
        
        // 触发ValueChanged事件
        emit ValueChanged(msg.sender, oldVal, _newValue);
    }
    
    // 注册用户并触发UserRegistered事件
    function registerUser(string memory _name) public {
        require(!registeredUsers[msg.sender], "User already registered");
        
        userNames[msg.sender] = _name;
        registeredUsers[msg.sender] = true;
        
        // 触发UserRegistered事件
        emit UserRegistered(msg.sender, _name, block.timestamp);
    }
    
    // 模拟交易并触发TransactionExecuted事件
    function executeTransaction(address _to, uint256 _amount) public returns (bool) {
        // 简单模拟交易逻辑
        bool success = _amount > 0 && _to != address(0);
        
        // 触发TransactionExecuted事件
        emit TransactionExecuted(msg.sender, _to, _amount, success);
        
        return success;
    }
    
    // 获取当前值
    function getValue() public view returns (uint256) {
        return currentValue;
    }
}