// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
    Define fallback function
    1. Cannot have a name
    2. Doesnt take any inputs
    3. Doesnt return any outputs
    4. Must be declared as external
*/
contract Fallback {
    event Log(uint gas);

    fallback () external payable {
        // not recommended to write much code
        
        // invoke send method: we get 2300 gas which is enough to emit a log
        // invoke call method: we get all the gas

        // special solidity function called gasleft returns how much gas is left
        emit Log(gasleft());
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// new contract will send ETHto fallback contract which will trigger fallback function

contract sendToFallback {
    
    function transferToFallback(address payable _to) public payable {
        // send ether with the transfer method
        // automatically transfer will transfer 2300 gas amount
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        // send ether with the call method
        (bool sent,) = _to.call{value:msg.value}('');
        require(sent, 'Failed to send!');
    }
}