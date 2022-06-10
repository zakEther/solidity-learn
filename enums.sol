// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EnumsLearn {
    // enum frenchFriesSize {LARGE, MEDIUM, SMALL}
    // frenchFriesSize choice;
    // frenchFriesSize constant defaultChoice = frenchFriesSize.MEDIUM;

    // function setSmall() public {
    //     choice = frenchFriesSize.SMALL;
    // }

    // function getChoice() public view returns (frenchFriesSize) {
    //     return choice;
    // }

    // function getDefaultChoice() public view returns (uint) {
    //     return uint (defaultChoice);
    // }

    enum shirtColor{RED, WHITE, BLUE}
    shirtColor constant defaultColor = shirtColor.BLUE;
    shirtColor choice;

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns (shirtColor) {
        return choice;
    }
    
    function getDefaultChoice() public view returns (uint) {
        return uint(defaultColor);
    }
}