//SPDX-License-Identifier: MIT  
pragma solidity ^0.8.7;

// To send Ether from a contract to another contract, the targeted
// function must be payable and the function that calls it must also be payable

contract MainContract {

    function sendEther(address _addr) external payable {
        ContractCalled(_addr).receiveEther{value:msg.value}(12345, true);
    }
}

contract ContractCalled {

    uint public balance;
    uint public passedNum;
    bool public passedBool;

    function receiveEther(uint _passedNum, bool _myBool) external payable {
        balance = msg.value;
        passedNum = _passedNum;
        passedBool = _myBool;
    }

}
