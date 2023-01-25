//SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract Escrow {

     //this enum stores the current state of the tarnsaction
     enum State{AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}

     //variable to hold the State
     State public currentState;

     //buyer address
     address public buyer;

     //seller address
     address payable public seller;

     //Ensure that only the buyer can call functions the modifier is attached to
     modifier onlyBuyer() {
         require(msg.sender==buyer, "only the buyer can call the function!");
         _;
     }

     // Set up the buyer and seller address
     constructor(address _buyer, address payable _seller) {
         buyer = _buyer;
         seller = _seller;
     }
     
     // only the buyer can call this function to deposit Ether to the contarct
     function deposit() onlyBuyer external payable {
         require(currentState==State.AWAITING_PAYMENT, "buyer has already deposited Ether to the contarcat");
         currentState = State.AWAITING_DELIVERY;
     }

     // The buyer calls this function to confirm that they have received the item for sale
     function confirmDelivery() onlyBuyer external {
         require(currentState==State.AWAITING_DELIVERY, "Delivery has not been confirmed yet!");
         seller.transfer(address(this).balance);
         currentState = State.COMPLETE;
     }

}
