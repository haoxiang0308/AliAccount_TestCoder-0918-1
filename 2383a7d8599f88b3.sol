// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PayableContract {
    address payable public owner;
    
    constructor() {
        owner = payable(msg.sender);
    }
    
    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw");
        owner.transfer(address(this).balance);
    }
    
    function deposit() public payable {
        // This function accepts Ether
    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}