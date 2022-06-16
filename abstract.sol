// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.0 < 0.9.0;

/* 
--- ABSTRACT CONTRACT  

*/
abstract contract X {
    // since the function has no implementation we should mark it as virtual 
    function y() public view virtual returns (string memory);
}

contract A is X {
    function y() public view override returns (string memory) {
        return 'hello';
    }
}

contract Member {
    string name;
    uint age = 38;

    function setName() public virtual returns (string memory) {}

    function returnAge() public view returns (uint) {
        return age;
    }
}

contract Teacher is Member {
    function setName() public view override returns (string memory) {
        return 'Harry';
    }
}

contract Calculator {
    function getResult() public view virtual returns (uint) {}
}

contract Test is Calculator {
    function getResult() public view override returns (uint) {
        uint a = 1;
        uint b = 2;
        return a + b;
    }
}