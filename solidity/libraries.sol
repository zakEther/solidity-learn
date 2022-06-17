// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.0 <0.9.0;

library Search2 {
    // we want this loop to return the index value of some integer we are searching for
    function indexOf(uint[] storage self, uint value) public view returns (uint) {
        for (uint i = 0; i < self.length; i++) {
            if (self[i] == value) return i;
        }
    }
}

contract Test2 {
    uint[] data;
    using Search2 for uint[];

    constructor() public {
        data.push(1);
        data.push(2);
        data.push(3);
        data.push(4);
        data.push(5);
    }

    function isValuePresent(uint val) external view returns (uint) {
        uint value = 4;
        uint index = data.indexOf(value);
        return index;
    }
}

