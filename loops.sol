// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract loopContract {
    // create a function that can check if two numbers are divisible by each other - or are they
    // multiples of each other

    // 4 and 2 - return true
    // 3 and 5 - return false
    // i was index

    uint [] public numbersList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    function checkMultiples(uint _number) public view returns(uint) {
        uint count = 0;
        for(uint i=1; i < numbersList.length; i++) {
            if(checkMultiplesValidity(numbersList[i], _number)) {
                count++;
            }
        }
        return count;
    } 

    function checkMultiplesValidity(uint _num, uint _nums) public view returns(bool) {
        if(_num % _nums == 0) {
            return true;
        } else {
            return false;
        }
    } 
}