// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract learnArrays {
    uint[] public myArray;
    uint[] public myArray2;
    uint[200] public myFixedSizedArray;

    function push(uint number) public {
        myArray.push(number);
    }

    function pop() public {
        myArray.pop;
    }

    function getLenth() public view returns (uint) {
        myArray.length;
    }

    function remove(uint i) public {
        delete myArray[i];

    } 

    uint[] public changeArray;

    function removeElement(uint i) public {
        // пользователь вводит индекс элемента, который должен выполнить:
        // 1. число последнего индекса массива заменить на user_i
        // 2. удалить последний индекс

        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    }

    function test() public {
        for(uint i = 1; i <= 4; i++) {
            changeArray.push(i);
        }
    }

    function getChangeArray() public view returns (uint[] memory) {
        return changeArray;
    }
}