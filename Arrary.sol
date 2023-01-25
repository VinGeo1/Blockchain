// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract Storage {

    address[12] registry;
    
    address[] dynamic_registry;
   
    uint256[3] balances = [1, 2, 3];


 

    

    error InvalidIndex(uint index, uint array_size);
    /**
     * @dev Store value in variable
     * @param num value to store
     */
    

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (address){
        return registry[3];
    }

     function retrieve_dynamic(uint _index) public view  returns (address){
         if(_index < dynamic_registry.length) { 
             return dynamic_registry[_index];
             
        }else{
            revert("invalid Index");
        }
        
    }


    function getArray() public view returns(address[] memory)
   {
     return dynamic_registry;
   }


   function f(uint len) public pure {
        uint[] memory a = new uint[](7);
        bytes memory b = new bytes(len);
        assert(a.length == 7);
        assert(b.length == len);
        a[6] = 8;
    }


     
}
