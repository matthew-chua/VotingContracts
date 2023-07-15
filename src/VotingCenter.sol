// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VotingCenter {

    //these 2 should be encrypted, private values
    uint256 private candidate1;
    uint256 private candidate2;
    
    uint256 public endTime;

    address public votingToken;
    
    constructor(uint votingTime, address _votingToken) {
        candidate1 = 0;
        candidate2 = 0;
        endTime = block.timestamp + votingTime;
        votingToken = _votingToken;
    }

    function checkWinner() public view returns (string memory) {
        require(block.timestamp > endTime, "Voting is still in progress");
        if (candidate1 > candidate2) {
            return "candidate1";
        } else {
            return "candidate2";
        }
    }

    //input should be encrypted
    function vote(uint candidate) public {
        require(block.timestamp < endTime, "Voting is over");
        
        //check if user has voting token, and transfer voting token to contract

        if (candidate == 1) {
            candidate1++;
        } else if (candidate == 2) {
            candidate2++;
        } else {
            revert("Invalid candidate");
        }
    }
}