// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    
    function totalSupply() external view returns (uint256);

    function balanceOf(address account) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);
    
    function transfer(address recipient, uint256 amount) external returns (bool);

    function approve(address spender, uint256 amount) external returns (bool);

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);

}

contract CLDCoin is IERC20 {

    string public constant name = "Caliadra";
    string public constant symbol = "CLD";
    uint8 public constant decimals = 18;

    mapping(address => uint256) internal balances;
    mapping(address => mapping(address => uint256)) allowed;

    uint256 totalSupply_ = 100 ether;

    constructor() {
        balances[msg.sender] = totalSupply_;
    }

    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    function transfer(address recipient, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender], "Saldo insuficiente");
        balances[msg.sender] -= numTokens;
        balances[recipient] += numTokens;
        emit Transfer(msg.sender, recipient, numTokens);
        return true;
    }

    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    function allowance(address owner, address delegate) public override view returns (uint256) {
        return allowed[owner][delegate];
    }

    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(balances[owner] >= numTokens, "Saldo insuficiente");
        require(allowed[owner][msg.sender] >= numTokens, unicode"Limite de transferência excedido");

        balances[owner] -= numTokens;
        balances[buyer] += numTokens;
        allowed[owner][msg.sender] -= numTokens;
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
