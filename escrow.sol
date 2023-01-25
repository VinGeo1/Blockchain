//SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract Escrow {
    //this enum stores the current state of the transaction
    enum State {AwaTING_Payment,Awating_Delivery,Complete}
    
    //variable to hold the State
    State public currentState;

    // buyer address 
    address public buyer;

    //seller address
    address payable public seller;

    // Ensure that only the buyer can call functions the modifier is attached to
    modifier onlyBuyer(){
        require(msg.sender==buyer,"Only the buyer can call this function");
        _;
    }
    //set up the buyer and seller addresses
    constructor(address _buyer,address payable _seller)  {
        buyer = _buyer;
        seller = _seller;
    }
    //only the buyer can call this function to deposit to the contract

    function deposit() onlyBuyer external payable {
        require(currentState==State.AwaTING_Payment,"Buyer has already deposited ether to the contract");
        currentState = State.Awating_Delivery;
    }

    //the buyer calls this function to confirm that they have received the iteams for sale
    function confirmDelivery() onlyBuyer external {
        require(currentState==State.Awating_Delivery,"Delivery has not been confirmed yet !");
        seller.transfer(address(this).balance);
        currentState = State.Complete;
    }
}
