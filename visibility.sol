// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// VARIABLE SCOPE - Functions & VAriables

// PRIVATE = You can only call the function inside the contract 
// INTERNAL = Called only within the contract OR other contracts that inherit the smart contract
// EXTERNAL = You can only call the function from outside the contract not from other functions within
// PUBLIC = You can call the function from outside the smart contract as well inside the smart contract 

// State Variables vs Local VAriables

contract C {
    uint public data = 10;

    function x() public pure returns (uint) {
        uint newData = 25;
        return newData;
    }

    function y() public view returns (uint) {
        return data;
    }
}