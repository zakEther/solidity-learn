// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// contract loopContractExercise {
//     uint [] public longList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
//     uint [] public numbersList = [1, 4, 34, 56];

//     function checkNumbersList(uint _num) public pure returns(bool) {
//         if(_num == 1 || _num == 4 || _num == 34 || _num == 56) {
//             return true;
//         } else {
//             return false;
//         }
//     }

//     function checkEvenLongList(uint _num) public pure returns(uint) {
//         uint count = 0;
//         for(uint i=1; i < longList.length; i++) {
//             if(i % 2 == 0) {
//                 return count;
//             }
//         }

//     }
// }

contract loopContractExercise {
    uint [] longList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
    uint [] numbersList = [1, 4, 34, 56];

    function numbersListLoop(uint userNumber) public view returns(bool) {
        bool numberExists = false;
        for(uint i = 0; i < numbersList.length; i++) {
            if(numbersList[i] == userNumber) {
                numberExists = true;
            }
        }
        return numberExists;
    }

    function checkEvenLongList() public view returns(uint) {
        uint count = 0;
        for(uint i = 0; i < longList.length; i++) {
            if(longList[i] % 2 == 0) {
                count++;
            }
        }
        return count;
    }    

}