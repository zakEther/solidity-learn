//SPDX-License-Identifier: GPL-3.0
 
pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address payable[] public players; 
    address public manager; 
    
    constructor(){
        manager = msg.sender; 
    }
    
    receive () payable external{
        // each player sends exactly 0.1 ETH 
        require(msg.value == 0.1 ether);
        // appending the player to the players array
        players.push(payable(msg.sender));
    }
    
    function getBalance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }
    
    // function that returns a big random integer
    function random() internal view returns(uint){
       return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players.length)));
    }
    
    
    // selecting the winner
    function pickWinner() public {
        // only the manager can pick a winner if there are at least 3 players in the lottery
        require(msg.sender == manager);
        require (players.length >= 3);
        
        uint r = random();
        address payable winner;
    
        // computing a random index of the array
        uint index = r % players.length;
    
        winner = players[index]; // this is the winner
        winner.transfer(getBalance());
        
        // resetting the lottery for the next round
        players = new address payable[](0);
    }

}
