// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract learnMapping {
    
    mapping(address => uint) public myMap;

    function setAddress(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    function getAddress(address _addr) public view returns (uint) {
        return myMap[_addr];
    }

    function removeAddress(address _addr) public {
        delete myMap[_addr];
    }

    struct Movie {
        string title;
        string director;
    }

    mapping(uint => Movie) movie;
    mapping(address => mapping(uint => Movie)) public myMovie;

    function addMovie(uint id, string memory title, string memory director) public {
        movie[id] = Movie(title, director);
    }

    function addMyMovie(uint id, string memory title, string memory director) public {
        myMovie[msg.sender][id] = Movie(title, director);
        // msg.sender is a global variable which captures the person who is calling the contract 
    }
}