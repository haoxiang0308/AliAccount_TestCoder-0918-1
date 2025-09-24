// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("MyToken", "MTK") Ownable(initialOwner) {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // Optional: Add functions for minting or other custom logic here
    // Remember to consider the security implications of adding such functions.
}