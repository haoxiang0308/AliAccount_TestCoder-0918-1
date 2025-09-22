// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title Simple ERC-20 Token
 * @dev This is a simple implementation of the ERC-20 standard for demonstration purposes.
 */
contract SimpleToken {
    // Token metadata
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // Balances and allowances
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    // Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Constructor to initialize the token with initial supply
     * @param initialSupply The initial supply of tokens
     * @param tokenName The name of the token
     * @param tokenSymbol The symbol of the token
     */
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) {
        name = tokenName;
        symbol = tokenSymbol;
        decimals = 18;
        totalSupply = initialSupply * 10**decimals;
        _balances[msg.sender] = totalSupply;
        
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    /**
     * @dev Returns the balance of an account
     * @param account The address to query the balance of
     * @return The balance of the account
     */
    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev Transfers tokens to a specified address
     * @param to The address to transfer to
     * @param amount The amount to transfer
     * @return A boolean indicating success
     */
    function transfer(address to, uint256 amount) public returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    /**
     * @dev Internal function to handle transfers
     * @param from The address to transfer from
     * @param to The address to transfer to
     * @param amount The amount to transfer
     */
    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        
        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        
        _balances[from] = fromBalance - amount;
        _balances[to] += amount;
        
        emit Transfer(from, to, amount);
    }

    /**
     * @dev Approves a spender to spend a certain amount of tokens
     * @param spender The address to approve
     * @param amount The amount to approve
     * @return A boolean indicating success
     */
    function approve(address spender, uint256 amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    /**
     * @dev Internal function to handle approvals
     * @param owner The owner of the tokens
     * @param spender The address to approve
     * @param amount The amount to approve
     */
    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Returns the remaining number of tokens that spender is allowed to spend
     * @param owner The owner of the tokens
     * @param spender The address of the spender
     * @return The remaining allowance
     */
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev Transfers tokens from one address to another using allowance
     * @param from The address to transfer from
     * @param to The address to transfer to
     * @param amount The amount to transfer
     * @return A boolean indicating success
     */
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        address spender = msg.sender;
        uint256 currentAllowance = _allowances[from][spender];
        require(currentAllowance >= amount, "ERC20: insufficient allowance");
        
        _transfer(from, to, amount);
        
        _allowances[from][spender] = currentAllowance - amount;
        emit Approval(from, spender, currentAllowance - amount);
        
        return true;
    }
}