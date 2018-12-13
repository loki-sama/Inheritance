const Inheritance = artifacts.require("./Inheritance.sol");


contract('Inheritance', (accounts) => {
    const giver = accounts[0]
    const receiver= accounts[1]
    const numOfVotes = 3;
    const trustGroup = [accounts[3],accounts[4],accounts[5],accounts[6],accounts[7]];
    let inheritance;

    beforeEach(async ()=>{
        inheritance = await Inheritance.new(giver, receiver, numOfVotes, trustGroup, {value: 1000000});
        
    })

    it("should be deployed with a giver", async () => {
        
        const giverInContract = await inheritance.giver()
        assert.equal(giverInContract, giver)
    });
    it("should be deployed with a receiver", async () => {
        
        const receiverInContract = await inheritance.receiver()
        assert.equal(receiverInContract, receiver)
    });
    it("constructor should fire log event", async () => {
        let {logs} = await inheritance.eventEmitter()
        assert.equal(logs[0].args.giver, giver);
    });
});
