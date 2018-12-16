pragma solidity ^0.4.24;

contract Elections {
    //Model a Candidate
    struct Candidate {
        uint id;  //Unsigned Integer for userID
        string name;
        uint voteCount;
    }
    
    //store accounts that have voted
    mapping(address => bool) public voters;


    //Store a Candidate
    //Fetch a Candidate
    mapping(uint => Candidate) public candidates;
    
    //Store Candidates Count
    uint public candidatesCount;

    //voted Event
    event votedEvent(
        uint indexed _candidateId
    );

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

    function vote(uint _candidateId) public {
        //require that they haven't voted before
        require(!voters[msg.sender]);

        //require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true;

        //update candidat vote count
        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);
    }
}