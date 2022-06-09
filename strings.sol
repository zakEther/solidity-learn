// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract learnStrings {
    string greetings = 'Hello';

    function sayHello() public view returns (string memory) {
        return greetings;
    }

    function changeGreeting(string memory _greetings) public {
        greetings = _greetings;
    }

    function getChar() public view returns (uint) {
        // return greetings.length;

        bytes memory stringToBytes = bytes(greetings);
        return stringToBytes.length;
    }

    string public favoriteColour = 'blue';

    function myFavoriteColour() public view returns (string memory) {
        return favoriteColour;
    }

    function changeFavoriteColour(string memory _yourFavoriteColour) public {
        favoriteColour = _yourFavoriteColour;
    }

    function getCharOfFavoriteColour() public view returns (uint) {
        bytes memory stringToBytesFavoriteColour = bytes(favoriteColour);
        return stringToBytesFavoriteColour.length;
    }
}