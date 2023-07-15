// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

//ERC20 token with limited functionality
contract VotingToken {
    
    address public votingCenter;
    mapping(address => uint256) public balances;

    constructor(address _votingCenter) {
        votingCenter = _votingCenter;
    }

    //mint, only owner can call this, after KYC is completed
    function mint(address _to) public {
        require(msg.sender == votingCenter, "Only VotingCenter can mint");
        balances[_to]++;
    }

    //transferFrom, only VotingCenter can call this, and can only transfer to VotingCenter
    function transferFrom() public {
        require(msg.sender == votingCenter, "Only voting center can transfer");
        require(balances[msg.sender] > 0, "Not enough balance");
        balances[msg.sender]--;
        balances[votingCenter]++;
    }
}