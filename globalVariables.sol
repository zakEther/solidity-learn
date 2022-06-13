// SPDX-License-Identifier: MIT

// special or global variables

pragma solidity ^0.8.0;

contract LedgerBalance {
    //  create a map of wallet with amounts
    // set up a function that can update amount of the person calling the contract  - current 
    // address - msg.sender

    mapping(address => uint) balance;

    function updateBalance(uint newBalance) public {
        balance[msg.sender] = newBalance;
    }

    function checkMyBalance() public view returns (uint) {
        return balance[msg.sender];
    }
}

contract Updated {
    function updatesBalance() public {
        LedgerBalance ledgerBalance = new LedgerBalance();
        ledgerBalance.updateBalance(30);
    }
}

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}