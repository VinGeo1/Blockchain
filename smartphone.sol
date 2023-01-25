//SPDX-License-Identifier:MIT
pragma solidity >=0.4.22 <0.7.0;
contract cellSubscription {
    uint monthlyCost;

    constructor(uint cost) public {
        monthlyCost = cost;
    }
    function makepayment()payable public {
        //payable function is for to receive ether

    }
    function withdrawBalance() public {
        msg.sender.transfer(address(this).balance);//global variable-msg.sender ...addresss and ether balance
    }
    function isBalanceCurrent(uint monthsElapsed)public view returns(bool){
        return monthlyCost * monthsElapsed == address(this).balance;
    }
}
