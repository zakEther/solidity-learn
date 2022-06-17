// SPDX-License-Identifier: MIT

pragma solidity >= 0.8.0 <0.9.0;

contract LearnErrorHandling {
    bool public sunny = true;
    bool public umbrella = false;
    uint finalCalc = 0;

    // solar panel machine
    function solarCalc() public {
        require(sunny, "It is not sunny today!");
        finalCalc += 3;
    }

    // finalCalc can never equal 6
    function internalTest() public {
        assert(finalCalc != 6);
    }

    // machine that controls weather
    function weatherChanger() public {
        sunny = !sunny;
    }

    // grab final calc
    function getCalc() public view returns (uint) {
        return finalCalc;
    }

    function bringUmbrella() public {
        if(!sunny) {
            umbrella = true;
        } else {
        revert("No need to bring an umbrella today!");
        }
    }
}

contract Vendor {
    address seller;

    modifier onlySeller {
        require(msg.sender == seller);
        _;
    }

    function becomeSeller() public {
        seller = msg.sender;
    }

    function sell(uint amount) public payable onlySeller {
        if (amount > msg.value) {
            revert("There is not enough ether provided as an throw error");
        }
    } 
}