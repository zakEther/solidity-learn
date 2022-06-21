// SPDX-License_identifier: MIT

pragma solidity >= 0.8.0 < 0.9.0;

contract CrowdFunding {
    mapping(address => uint) public contributors;
    address public admin;
    uint public numOfContributors;
    uint public minContribution;
    uint public deadline; // timestamp
    uint public goal;
    uint public raisedAmount;

    constructor(uint _goal, uint _deadline) {
        goal = _goal;
        deadline = block.timestamp + _deadline;
        minContribution = 0.1 ether;
        admin = msg.sender;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Deadline has passed!");
        require(msg.value >= minContribution, "Minimum contribution not met!");
        if (contributors[msg.sender] == 0) {
            numOfContributors++;
        }
        contributors[msg.sender] += msg.value;
        raisedAmount += msg.value;
    }

    receive() payable external {
        contribute();
    }
}