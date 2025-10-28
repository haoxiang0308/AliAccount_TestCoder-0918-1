// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomEventContract {
    // 定义各种类型的事件
    event NewUserRegistered(address indexed user, string name, uint256 registrationTime);
    event FundsWithdrawn(address indexed user, uint256 amount, uint256 remainingBalance);
    event ContractPaused(address indexed admin);
    event ContractResumed(address indexed admin);
    event DataUpdated(uint256 indexed id, string oldValue, string newValue, address updatedBy);
    
    mapping(address => string) public users;
    mapping(uint256 => string) public dataRecords;
    uint256 public totalUsers;
    bool public isPaused;
    
    constructor() {
        totalUsers = 0;
        isPaused = false;
    }
    
    // 注册新用户，触发事件
    function registerUser(string memory name) public {
        require(!isPaused, "Contract is paused");
        require(bytes(users[msg.sender]).length == 0, "User already registered");
        
        users[msg.sender] = name;
        totalUsers++;
        
        // 触发新用户注册事件
        emit NewUserRegistered(msg.sender, name, block.timestamp);
    }
    
    // 提现函数，触发事件
    function withdrawFunds(uint256 amount) public {
        require(!isPaused, "Contract is paused");
        // 这里简化处理，实际应用中会有余额检查
        emit FundsWithdrawn(msg.sender, amount, 0);
    }
    
    // 暂停合约功能
    function pauseContract() public {
        isPaused = true;
        emit ContractPaused(msg.sender);
    }
    
    // 恢复合约功能
    function resumeContract() public {
        isPaused = false;
        emit ContractResumed(msg.sender);
    }
    
    // 更新数据并触发事件
    function updateData(uint256 id, string memory newValue) public {
        require(!isPaused, "Contract is paused");
        string memory oldValue = dataRecords[id];
        dataRecords[id] = newValue;
        
        emit DataUpdated(id, oldValue, newValue, msg.sender);
    }
    
    // 获取用户信息
    function getUserInfo(address user) public view returns (string memory) {
        return users[user];
    }
    
    // 检查合约是否暂停
    function checkPauseStatus() public view returns (bool) {
        return isPaused;
    }
}