// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimplePayableContract {
    address payable public owner;
    uint256 public totalValue;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        require(msg.value > 0, "Value must be greater than 0");
        totalValue += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        uint256 amount = address(this).balance;
        require(amount > 0, "No balance to withdraw");
        totalValue = 0;
        owner.transfer(amount);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}