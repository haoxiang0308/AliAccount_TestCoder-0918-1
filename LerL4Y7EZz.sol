// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address payable public owner;
    uint256 public totalBalance;

    constructor() {
        owner = payable(msg.sender);
    }

    // Payable function that allows receiving Ether
    function deposit() public payable {
        require(msg.value > 0, "Amount must be greater than 0");
        totalBalance += msg.value;
    }

    // Another payable function example
    function payToContract() public payable {
        require(msg.value > 0, "Must send some Ether");
        totalBalance += msg.value;
    }

    // Function to withdraw funds (only owner)
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = totalBalance;
        totalBalance = 0;
        owner.transfer(amount);
    }

    // Function to check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Fallback function to receive Ether
    receive() external payable {
        totalBalance += msg.value;
    }

    // Fallback function
    fallback() external payable {
        totalBalance += msg.value;
    }
}