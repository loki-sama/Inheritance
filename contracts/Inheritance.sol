//We need accounts (at least 2)
//the amount of money 
//time frame
//inheriter is only person able to take money
//Changable till your dead
//trust group (at least 3 of 5)

//every smart contract starts with a compiler version
pragma solidity 0.4.24;

contract Inheritance {
    address private receiver;
    address private giver;
    
    uint public moneyAmmount;
    uint8 public voteChecker;
    uint public numberOfVotes;
    uint public timeFrame = now + (365 days);
    
    struct Voters {
        bool vote;
        bool isVoter;
    }
    
    mapping(address => Voters) public trustGroupVoting;
    
    constructor(
        address _giver,
        address _receiver,
        uint _numberOfVotes,
        address[5] _trustGroup
    ) 
        public 
        payable 
    {
        require(msg.value > 0 && _trustGroup.length <= 5 && _numberOfVotes <= 5);
        
        moneyAmmount = msg.value;
        giver = _giver;
        receiver = _receiver;
        numberOfVotes = _numberOfVotes;
        
        for(uint8 n; n < _trustGroup.length; n++) {
            trustGroupVoting[_trustGroup[n]].isVoter = true; 
        }
    }
    
    function trustGroupVote(bool _vote) public {
        require(trustGroupVoting[msg.sender].isVoter );
        
        require(trustGroupVoting[msg.sender].vote != _vote);
        
        if (_vote) {
            voteChecker++;    
        } else {
            voteChecker--;
        }
        
        trustGroupVoting[msg.sender].vote = _vote;
    }
    
    function withdraw() public {
        require( voteChecker >= numberOfVotes);
        require(msg.sender == receiver);
        
        receiver.transfer(moneyAmmount);
    }
}
