// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RandomContract_789 {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function withdraw() external {
        require(msg.sender == owner, "Only the owner can withdraw");
        owner.transfer(address(this).balance);
    }

    // A payable function that sends Ether to the contract
    function fundContract() public payable {
        // The function body can be empty, or perform other logic
        // The `payable` keyword allows it to receive Ether
    }

    // Function to check the balance of the contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}