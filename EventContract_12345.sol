// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventExample {
    // 定义事件
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event LogMessage(string message, uint256 timestamp);
    
    // 合约状态变量
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;
    
    constructor() {
        balances[msg.sender] = 1000;
    }
    
    // 触发Transfer事件的函数
    function transfer(address _to, uint256 _value) public {
        require(balances[msg.sender] >= _value, "Insufficient balance");
        
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        
        // 触发Transfer事件
        emit Transfer(msg.sender, _to, _value);
    }
    
    // 触发Approval事件的函数
    function approve(address _spender, uint256 _value) public {
        allowance[msg.sender][_spender] = _value;
        
        // 触发Approval事件
        emit Approval(msg.sender, _spender, _value);
    }
    
    // 触发自定义LogMessage事件的函数
    function logSomething(string memory _message) public {
        // 触发LogMessage事件
        emit LogMessage(_message, block.timestamp);
    }
    
    // 辅助函数：获取当前时间戳
    function getCurrentTime() public view returns (uint256) {
        return block.timestamp;
    }
}