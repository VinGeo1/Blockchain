//SPDX-License-Identifier: MIT  
pragma solidity ^0.5.7;


// Essentially, a smart contract can be thought of as a programmable
// intermediary which can facilitate transactions between parties
// and autonomously settling disputes. Which is perfect for something
// like a 'Last Will And Testament' to distribute an inheritance
// to various beneficiaries.

// EXERCISE: 
// 1. Refactor the code to use an array of Structs to hold the beneficiary information,
// without using a mapping.
// 2. create a function to translate the value entered in Ether to Wei.
// 3. Add some require statement to make sure the balance in the contract is sufficient to cover
// the setInheritance values



contract LastWillAndTestament {

    address owner;
    uint funds;
    bool isDeceased;
    uint remainingamount; //remaining balance

    constructor() public payable {
        owner = msg.sender; 
        funds = msg.value;
        isDeceased = false;
        remainingamount = msg.value; // Initialize remaining balance
    }

    modifier onlyOwner() {
        require (msg.sender == owner, "You are not the owner of the contract.");
        _;
    }

    modifier isOwnerDeceased() {
        require (isDeceased==true, "Contract owner must be deceased for funds to be distributed.");
        _;
    }

    // Modifier to have enough amount
    modifier enoughAmount(uint AmountToBeDistrubute) {
        require (AmountToBeDistrubute <= remainingamount, "Not enough fund to distribute");
        _;
    }

    // Declaring the structure of beneficiary. This strucut will be holding beneficiary information 
    struct beneficiaryInformation {
        address payable beneficiaryAddress;
        uint beneficiaryAmt;
    }
    // Declaring a array of beneficiaryInformation
    beneficiaryInformation[] public beneficiary; 
    // function to set inheritance details
    function setInheritance(address payable _account, uint _inheritAmt) public onlyOwner enoughAmount(_inheritAmt) {
        beneficiary.push(beneficiaryInformation(_account, _inheritAmt));
        remainingamount -= _inheritAmt; // update the remaining fund
    }


    // loop through a arrary of "beneficiaryInformation" instead of mapping
    function distributeFunds() private isOwnerDeceased {
        for (uint i=0; i<beneficiary.length; i++) {
            beneficiary[i].beneficiaryAddress.transfer(beneficiary[i].beneficiaryAmt);
        }
    }        
    
    // QUESTION? How would this function get called if the owner is deceased? 
    function deceased() public onlyOwner {
        isDeceased = true;
        distributeFunds();
    }

    // function to convert the value entered in Ether to Wei.
    function EthToWei (uint _ethInput) public pure returns (uint) {
        return _ethInput * (1000000000000000000);
    }
}
