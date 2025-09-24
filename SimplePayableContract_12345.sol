// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimplePayableContract {
    address payable public owner;
    uint256 public balance;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(balance);
        balance = 0;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}