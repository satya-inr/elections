pragma solidity ^0.4.24;

contract Elections {
    //Model a Candidate
    struct Candidate {
        uint id;  //Unsigned Integer for userID
        string name;
        uint voteCount;
    }
    
    //Store a Candidate
    //Fetch a Candidate
    mapping(uint => Candidate) public candidates;
    
    //Store Candidates Count
    uint public candidatesCount;

    //Constructor
    constructor() public {
       addCandidate('candidate1');
       addCandidate('candidate2');
    }

    //adding Candidates
    function addCandidate(string _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount,_name,0);       
    }
}