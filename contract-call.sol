//SPDX-License-Identifier: MIT  
pragma solidity ^0.8.7;

contract MainContract {

    function callContractGreeting(address _addr) external pure returns (string memory) {
        return ContractGreeting(_addr).hiThere();
    }
}

contract ContractGreeting {

    function hiThere() external pure returns (string memory) {
        return "How are you doing?";
    }


}
