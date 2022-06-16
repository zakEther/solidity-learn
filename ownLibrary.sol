// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.0 <0.9.0;

library Math {
    function addition(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    function subtraction(uint a, uint b) public pure returns (uint) {
        return a - b;
    }

    function division(uint a, uint b) public pure returns (uint) {
        return a / b;
    }

    function multiplication(uint a, uint b) public pure returns (uint) {
        return a * b;
    }
}
