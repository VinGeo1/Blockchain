//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract BaseContract{
    //private function can only be called from within the contract
    //contracts that inherit from this contract cannot call the
    //following function:

    function privateFunction() private pure returns(string memory){
        return "PRIVATE FUNCTION CALLED";
    }
    function testPrivateFunction() public pure returns (string memory){
        return privateFunction();
    }
    // INTERNAL function can be called from inside this contract and
    //inside contracts that inherit from this contract

    function internalFunction() public pure virtual returns (string memory){
        return "INTERNAL FUNCTION CALLED";        
    }
    function testInternalFunction() public pure virtual returns (string memory){
        return internalFunction();
    }
    //Public function can be called inside this contract,inside contracts that inherits
    //from this contract,and by other conteacts and external accounts

    function publicFunction() public pure returns (string memory){
        return "PUBLIC FUNCTION CALLED";
    }
    // EXTERNAL FUNCTIONS CAN only be called by other cantracts and external accounts

    function externalFunction() external pure returns (string memory){
        return "External function called";
    }
    // the following function will not work because we are attempting to call
    //an external function 
    //function testExternalFunction() public pure returns (string memory){
    //returns externalFunction();
    //}


    //State variable

    string private privateVariable = "My private variable";
    string internal internalVariable = "My internal variable";
    string public publicVariable= "My public variable";
    //State variable cannot be External so this will not work.....
    //string external externalVariable ="My external variable";

}

//Child contract
//Inheritance contracts do not have access to private functions or state variables.
contract Child is BaseContract{

    //function testPrivateFunction() public pure returns (string memory){
    //returns privateFunction();
    //}

    //INTERNAL function call can be made from within a child contract
    function testInternalFunction() public pure override returns(string memory){
        return internalFunction();
    }

}
