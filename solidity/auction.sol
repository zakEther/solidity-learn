// SPDX-License-Identifier: MIT

/* 
    This contarct was working for simple Decentralize Auction 
*/


pragma solidity >= 0.8.0 < 0.9.0;

contract Auction {
    address payable public owner;
    uint public startBlock;
    uint public endBlock;
    string public ipfsHash;

    enum State {Started, Running, Ended, Canceled}
    State public auctionState;

    address payable public highestBidder;
    uint public highestBindingBid;

    constructor() {
        owner = payable(msg.sender);
        auctionState = State.Running;

        startBlock = block.number;
        endBlock = startBlock + 3;

        ipfsHash = "";
        bidIncrement = 1000000000000000000; // bidding in multiple of ETH
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    modifier notOwner {
        require(msg.sender != owner);
        _;
    }

    modifier afterStart(){
        require(block.number >= startBlock);
        _;
    }
    
    modifier beforeEnd(){
        require(block.number <= endBlock);
        _;
    }

    mapping(address => uint) public bids;
    uint bidIncrement;

    // a helper pure function (it neither reads, nor it writes to the blockchain)
    function min(uint a, uint b) internal pure returns (uint) {
        if (a <= b) {
            return a;
        } else {
            return b;
        }
    }
    
    // only the owner can cancel the Auction before the Auction has ended
    function cancelAuction() public beforeEnd onlyOwner {
        auctionState = State.Canceled;
    }
    
    bool public ownerFinalized = false;

    // the main function called to place a bid
    function placeBid() public payable notOwner afterStart beforeEnd returns (bool) {
        require(auctionState == State.Running);
        
        uint currentBid = bids[msg.sender] + msg.value;
        
        require(currentBid > highestBindingBid);
        
        // updating the mapping variable
        bids[msg.sender] = currentBid;
        
        if (currentBid <= bids[highestBidder]) { // highestBidder remains unchanged
            highestBindingBid = min(currentBid + bidIncrement, bids[highestBidder]);
        } else { // highestBidder is another bidder
            highestBindingBid = min(currentBid, bids[highestBidder] + bidIncrement);
            highestBidder = payable(msg.sender);
        }
    return true;
    }
    
    function finalizeAuction() public{
       // the auction has been Canceled or Ended
       require(auctionState == State.Canceled || block.number > endBlock); 
       
       // only the owner or a bidder can finalize the auction
       require(msg.sender == owner || bids[msg.sender] > 0);
       
       // the recipient will get the value
       address payable recipient;
       uint value;
       
        if (auctionState == State.Canceled){ // auction canceled, not ended
           recipient = payable(msg.sender);
           value = bids[msg.sender];
        } else { // auction ended, not canceled
            if (msg.sender == owner && ownerFinalized == false){ //the owner finalizes the auction
               recipient = owner;
               value = highestBindingBid;
               
               // the owner can finalize the auction and get the highestBindingBid only once
               ownerFinalized = true; 
            } else { // another user (not the owner) finalizes the auction
                if (msg.sender == highestBidder){
                   recipient = highestBidder;
                   value = bids[highestBidder] - highestBindingBid;
                } else { //this is neither the owner nor the highest bidder (it's a regular bidder)
                   recipient = payable(msg.sender);
                   value = bids[msg.sender];
                }
           }
       }
       
       // resetting the bids of the recipient to avoid multiple transfers to the same recipient
       bids[recipient] = 0;
       
       //sends value to the recipient
       recipient.transfer(value);
     
    }
}