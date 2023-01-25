// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Ballot {
    struct Voter { // Struct
        uint age;
        bool voted;
        address delegate;
        uint vote;
    }

    Voter public voter; 

    constructor(){
    voter=Voter({
        age: 37,
        voted: false, 
        delegate: 0x4B0e51aAf102b4a9ed8FBc04F956234612F0baa6,
        vote: 1}
     );
    }


    function contribute() public pure returns (Voter memory) {
        Voter memory v = Voter({
        age: 37,
        voted: false, 
        delegate: 0x4B0e51aAf102b4a9ed8FBc04F956234612F0baa6,
        vote: 1}
     );

     return v;

    }


    function getVoter() public view returns(Voter memory){
        return voter;
    }


    function addVote(uint count) public returns (uint){
        voter.vote+=count;
        return voter.vote;
    }
}
