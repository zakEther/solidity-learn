// SPDX-License-Identifier: MIT

// -- operators --

// Arithmetic Operators: + - * / % **

pragma solidity ^0.8.0;

// contract ComparisonOperators {

//     uint a = 3;
//     uint b = 5;

//     // Only run the function compare so that a is equal to or less than b
//     // otherwise submit the message - this comparison is false
//     function compare() public view {

//         // < -- less than

//         require(a <= b, 'That is false'); 
//     }
// }

contract FinalExercise {
    uint a = 300;
    uint b = 12;   
    uint f = 47;

    function finalize() public view returns(uint) {
        uint d = 23;
        return d *= d - b;
    }
}