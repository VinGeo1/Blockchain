//SPDX-License-Identifier:MIT
pragma solidity ^0.8.9;

contract FrenchFries {
    enum Size{Regular,Large,SUPERSIZE}
    Size choice;

    function setChoice(Size _choice)public {
        if(uint(_choice)==0){
            choice=Size.Regular;
        }else{
            if(uint(_choice)==1){
                choice=Size.Large;
            }else{
                choice = Size.SUPERSIZE;
            }
        }
    }
    function getChoice() public view returns(Size){
        return choice;
    }
}
