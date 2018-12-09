pragma solidity ^0.4.24;

contract Elections {

    //Storing a candidate name using a state variable
    string public candidate;
    //Constructor
    constructor() public {
        candidate = "Candidate1";
    }
}