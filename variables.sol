//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract Variables {
//State variable are stored on the blockchain
string public text ="Hello World";
uint public myNumber = 1000;

function myfunction() public pure {
    //Local Variables are not saved to the blockchain
    uint i = 22;
    i++;
}
// Example of Global Variables
//Current block timestamp
uint timestamp = block.timestamp;
//Address of the caller 
address sender = msg.sender;
//Ether value sent 
uint amount =msg.value;

}
