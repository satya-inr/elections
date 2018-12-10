var Elections = artifacts.require("./Elections.sol");

contract('Elections',function(accounts){

    var electionInstance;

    it("initialize with two candidates", function(){
        return Elections.deployed().then(function(instance){
            return instance.candidatesCount();
        }).then(function(count){
            assert.equal(count,2);
        })
    })

    it("it initializes the candidate with the correct value",function(){
        return Elections.deployed().then(function(instance){
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function(candidate){
            assert.equal(candidate[0],1,"Contains the correct id");
            assert.equal(candidate[1],'candidate1',"contains the correct name");
            assert.equal(candidate[2],0,"contains the correct votes");
            return electionInstance.candidates(2);
        }).then(function(candidate){
            assert.equal(candidate[0],2,"Contains the correct id");
            assert.equal(candidate[1],'candidate2',"contains the correct name");
            assert.equal(candidate[2],0,"contains the correct votes");
        })
    })

})