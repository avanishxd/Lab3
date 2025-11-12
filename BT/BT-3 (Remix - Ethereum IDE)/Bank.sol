// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Bank {
    uint256 private balance;
    address public accOwner;

    constructor() {
        accOwner = msg.sender;
    }

    function deposit() public payable {
        require(accOwner == msg.sender, "Only owner can deposit");
        require(msg.value > 0, "Amount should be greater than 0");
        balance += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == accOwner, "You are not the owner of this account");
        require(amount <= balance, "Not enough balance!");

        balance -= amount;
        payable(msg.sender).transfer(amount);
    }

    function showBalance() public view returns (uint256) {
        require(accOwner == msg.sender, "You are not the account owner");
        return balance;
    }
}
