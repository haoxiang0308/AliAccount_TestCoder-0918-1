// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentContract {
    address payable public owner;
    uint256 public totalBalance;

    constructor() {
        owner = payable(msg.sender);
    }

    // Payable function to receive Ether
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        totalBalance += msg.value;
    }

    // Function to withdraw funds (only owner)
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = totalBalance;
        totalBalance = 0;
        owner.transfer(amount);
    }

    // Function to get contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Fallback function to receive Ether
    fallback() external payable {
        totalBalance += msg.value;
    }

    // Receive function to receive Ether
    receive() external payable {
        totalBalance += msg.value;
    }
}