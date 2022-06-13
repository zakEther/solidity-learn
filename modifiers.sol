// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Modifiers {
    address owner;
    uint creationTime = 2 hours;
    uint price;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier onlyAfter (uint time) {
        require(creationTime >= time, "Function called too early!");
        _;
    }


    modifier costs (uint price) {
        if (msg.value >= price) {
        _;
      }
   }
}