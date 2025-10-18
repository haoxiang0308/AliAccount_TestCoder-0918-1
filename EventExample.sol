// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event ValueChanged(address indexed sender, uint256 oldValue, uint256 newValue);
    event UserRegistered(address indexed user, string name);
    event TransactionCompleted(address indexed from, address indexed to, uint256 amount);

    uint256 private value;
    mapping(address => string) public userNames;

    constructor() {
        value = 0;
    }

    // 修改值的函数，会触发ValueChanged事件
    function setValue(uint256 _newValue) public {
        uint256 oldValue = value;
        value = _newValue;
        
        // 触发事件
        emit ValueChanged(msg.sender, oldValue, _newValue);
    }

    // 注册用户的函数，会触发UserRegistered事件
    function registerUser(string memory _name) public {
        userNames[msg.sender] = _name;
        
        // 触发事件
        emit UserRegistered(msg.sender, _name);
    }

    // 完成交易的函数，会触发TransactionCompleted事件
    function completeTransaction(address _to, uint256 _amount) public payable {
        // 触发事件
        emit TransactionCompleted(msg.sender, _to, _amount);
    }

    // 获取当前值
    function getValue() public view returns (uint256) {
        return value;
    }
}