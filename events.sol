// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract LearnEvents {
    event newTrade(
        //only use 3 indexed per event
        uint indexed date,
        uint indexed amount,
        address from,
        address indexed to
    );
    
    function trade(address to, uint amount) external {
        emit newTrade(block.timestamp, to, amount);
    }
}