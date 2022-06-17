// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract GenerateRandomNumber {
    Oracle oracle;
    address admin;
    constructor(address oracleAddress) {
        oracle = Oracle(address oracleAddress);
        admin = msg.sender;
    }

    // build a random number generator which takes an input range and uses cryptographic hashing

    function randMod(uint range) external view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % range;
    }
}

contract Oracle {
    address admin;
    uint rand;

    constructor() {
        admin = msg.sender;
    }

    function setRand(uint _rand) external {
        require(msg.sender == admin);
        rand = _rand;
    }




}