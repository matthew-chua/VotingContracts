// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//ERC20 token with limited functionality
contract VotingToken {
    
    address owner;
    address votingCenter;

    constructor(address _votingCenter) {
        owner = msg.sender;
        votingCenter = _votingCenter;
    }

    //mint, only owner can call this, after KYC is completed

    //approve

    //transferFrom, only VotingCenter can call this, and can only transfer to VotingCenter
}