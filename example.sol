//SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

contract counter {
    uint public count;
    function get()public view returns(uint){
        return count;
    }
    function inc()public {
        count+=1;
    }
    function dec()public{
        require(count >0,"The counter must be greater than zero");
        count-=1;
    }
}
