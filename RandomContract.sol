// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableExample {
    // Address of the contract owner
    address payable public owner;
    
    // Event to log deposits
    event Deposit(address indexed from, uint256 amount);
    
    // Event to log withdrawals
    event Withdrawal(address indexed to, uint256 amount);
    
    // Constructor sets the owner
    constructor() {
        owner = payable(msg.sender);
    }
    
    // Function to deposit ether into the contract
    function deposit() public payable {
        // msg.value contains the amount of wei sent with the transaction
        emit Deposit(msg.sender, msg.value);
    }
    
    // Function to check the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    
    // Function to withdraw ether from the contract (only owner)
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= address(this).balance, "Insufficient balance");
        
        // Transfer the specified amount to the owner
        owner.transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }
}