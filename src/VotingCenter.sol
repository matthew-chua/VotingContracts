// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./VotingToken.sol";

contract VotingCenter {

    //these 2 should be encrypted, private values
    uint256 private candidate1;
    uint256 private candidate2;
    
    uint256 public endTime;

    address public owner;
    VotingToken votingToken;
    
    constructor(uint votingTime) {
        candidate1 = 0;
        candidate2 = 0;
        endTime = block.timestamp + votingTime;
        votingToken = VotingToken(address(this));
    }

    //called by the backend script
    function mint(address _to) public {
        require(msg.sender == owner, "Only owner can mint");
        votingToken.mint(_to);
    }

    function checkWinner() public view returns (string memory) {
        require(block.timestamp > endTime, "Voting is still in progress");
        if (candidate1 > candidate2) {
            return "candidate1";
        } else {
            return "candidate2";
        }
    }

    //input should be encrypted, called from the FE
    function vote(uint candidate) public {
        require(block.timestamp < endTime, "Voting is over");
        
        //call VotingToken.transferFrom()

        if (candidate == 1) {
            candidate1++;
        } else if (candidate == 2) {
            candidate2++;
        } else {
            revert("Invalid candidate");
        }
    }
}